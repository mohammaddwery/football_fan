import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:fixture/src/data/model/fixture/fixture_extension.dart';
import 'package:fixture/src/data/model/local_fixture_details/local_fixture_details_extension.dart';
import 'package:fixture/src/data/model/local_fixture_details/locale_fixture_details.dart';
import 'package:fixture/src/domain/use_case/fetch_local_fixture_details_use_case.dart';
import 'package:flutter/material.dart';
import '../../../core/enum.dart';
import '../../../data/model/fixture_details/fixture_details.dart';
import '../../../data/model/local_fixture_details/local_fixture_details_adapter.dart';
import '../../../domain/use_case/fetch_remote_fixtures_details_list_use_case.dart';
import '../../../domain/use_case/save_local_fixture_details_use_case.dart';
import '../../widgets/results_listing/base_results_listing_widget_bloc.dart';

class FixturesScreenBloc extends BaseResultsListingWidgetBloc<FixtureDetails> {
  final FetchRemoteFixtureDetailsListUseCase _fetchRemoteFixturesUseCase;
  final FetchLocalFixtureDetailsUseCase _fetchLocalFixtureDetailsUseCase;
  final SaveLocalFixtureDetailsUseCase _saveLocalFixtureDetailsUseCase;
  FixturesScreenBloc({
    required FetchRemoteFixtureDetailsListUseCase fetchRemoteFixturesUseCase,
    required FetchLocalFixtureDetailsUseCase fetchLocalFixtureDetailsUseCase,
    required SaveLocalFixtureDetailsUseCase saveLocalFixtureDetailsUseCase,
  }): _fetchRemoteFixturesUseCase = fetchRemoteFixturesUseCase,
        _saveLocalFixtureDetailsUseCase = saveLocalFixtureDetailsUseCase,
        _fetchLocalFixtureDetailsUseCase = fetchLocalFixtureDetailsUseCase {
    fetchLocalListItems();
  }

  final PageStorageBucket pageStorageBucket = PageStorageBucket();

  final BehaviorSubject<FixturesTab> _currentFixturesTabController = BehaviorSubject.seeded(FixturesTab.finished);
  ValueStream<FixturesTab> get currentFixturesTabStream => _currentFixturesTabController.stream;
  FixturesTab getCurrentFixturesTab() => _currentFixturesTabController.value;
  void setCurrentFixturesTab(FixturesTab uiState) => _currentFixturesTabController.sink.add(uiState);

  List<FixtureDetails> get finishedFixtures => getListItems()?.data?.where((e) => e.fixture.isFinished).toList()??[];
  List<FixtureDetails> get upcomingFixtures => getListItems()?.data?.where((e) => e.fixture.isUpcoming).toList()??[];

  onFixturesTabChanged(FixturesTab tab) {
    setCurrentFixturesTab(tab);
  }

  reloadFixtures() {
    fetchRemoteListItems();
  }

  @override
  dispose() {
    _currentFixturesTabController.close();
    super.dispose();
  }

  @override
  fetchRemoteListItems() {
    handleResultListRequest(
      getCurrentState: getListItems,
      setCurrentState: setListItems,
      exceptionTag: 'fetchRemoteFixtures()',
      getResponseResult: () async {
        List<FixtureDetails> fixtureDetailsList = await _fetchRemoteFixturesUseCase.call(NoParams());
        _saveLocalFixtureDetailsUseCase.call(
            adaptFixtureDetailsListToLocalFixtureDetails(fixtureDetailsList)
        );
        return fixtureDetailsList;
      },
    );
  }

  @override
  fetchLocalListItems() {
    handleResultListRequest(
      setCurrentState: setListItems,
      getCurrentState: getListItems,
      onError: (message) => fetchRemoteListItems(),
      exceptionTag: 'fetchLocalFixtures()',
      getResponseResult: () async {
        await Future.delayed(const Duration(seconds: 2));
        LocalFixtureDetails localFixtureDetails = await _fetchLocalFixtureDetailsUseCase.call(NoParams());
        /// We need to determine the data resource to get the fixtures.
        /// We can hit the API once in the day then save the results locally.
        /// When we refresh the results we check if there are results stored locally,
        /// AND we still in the same day we display the stored results OTHERWISE,
        /// we hit the API to get new results.
        if(!localFixtureDetails.isLastSaveTryValid) {
          fetchRemoteListItems();
        }
        return localFixtureDetails.fixtureDetailsList;
      },
    );
  }


}