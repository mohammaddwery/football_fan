import 'dart:convert';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:fixture/src/data/model/fixture/fixture_extension.dart';
import 'package:fixture/src/data/model/status/status_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/enum.dart';
import '../../../data/model/fixture_details/fixture_details.dart';
import '../../../data/model/fixture_details/fixture_details_adapter.dart';
import '../../widgets/results_listing/base_results_listing_widget_bloc.dart';

class FixturesScreenBloc extends BaseResultsListingWidgetBloc<FixtureDetails> {
  FixturesScreenBloc() {
    fetchListItems();
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

  @override
  dispose() {
    _currentFixturesTabController.close();
    super.dispose();
  }

  @override
  fetchListItems({
    Function()? onData,
    Function(String message)? onError,
  }) {
    handleResultListRequest(
      getCurrentState: getListItems,
      setCurrentState: setListItems,
      onData: onData,
      onError: onError,
      exceptionTag: 'fetchFixtures()',
      getResponseResult: () async {
        await Future.delayed(const Duration(seconds: 2));
        String response = await rootBundle.loadString("packages/fixture/assets/fixtures.json");
        var jsonResponse = json.decode(response);
        return adaptJsonToFixtureDetailsList(jsonResponse['response']);
      },
    );
  }


}