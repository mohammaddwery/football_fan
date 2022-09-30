import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:fixture/src/data/model/fixture_details/fixture_details.dart';
import 'package:fixture/src/presentation/screens/fixtures/fixtures_screen_bloc.dart';
import 'package:fixture/src/presentation/widgets/results_listing/result_listing_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../core/enum.dart';
import '../../helpers/fixture_subtitles_keys.dart';
import '../../ui_state.dart';
import '../../widgets/base_widget_state.dart';
import '../../widgets/fixture_card.dart';
import '../../widgets/fixtures_screen_header/fixtures_screen_header.dart';
import '../../widgets/foat_selection_tab_bar/float_selection_tab_bar.dart';

class FixturesScreen extends StatefulWidget {
  const FixturesScreen({Key? key}) : super(key: key);

  @override
  BaseWidgetState<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends BaseWidgetState<FixturesScreen> {

  late FixturesScreenBloc fixturesScreenBloc = AppInjector.I.get();
  late FixtureNavigator fixturesNavigator = AppInjector.I.get();

  @override
  void dispose() {
    fixturesScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildFixturesResult(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const FixturesScreenHeader(),
      backgroundColor: Colors.white,
      toolbarHeight: 64,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
    );
  }

  Widget buildFixturesResult() {
    return StreamBuilder<UiState<List<FixtureDetails>>?>(
        stream: fixturesScreenBloc.listItemsStream,
        builder: (context, resultsSnapshot) {
          switch (resultsSnapshot.data?.status) {
            case UiStateStatus.loading:
              return LoadingWidget();
            case UiStateStatus.success:
              return buildFixturesPageView(resultsSnapshot.data!.data!);
            case UiStateStatus.noResults:
              return ErrorPlaceholderWidget(fixtureLocal.translate(FixtureSubtitlesKeys.noResultsFound));
            case UiStateStatus.failure:
              return ErrorPlaceholderWidget(
                resultsSnapshot.data!.message!,
                refreshButton: RefreshButton(
                  onClicked: fixturesScreenBloc.reloadFixtures,
                  title: fixtureLocal.translate(FixtureSubtitlesKeys.refresh),
                ),
              );

            default:
              return Container();
          }
        });
  }

  Widget buildFixturesPageView(List<FixtureDetails> fixtureDetails) {
    return StreamBuilder<FixturesTab>(
      initialData: FixturesTab.finished,
      stream: fixturesScreenBloc.currentFixturesTabStream,
      builder: (context, fixturesTabSnapshot) {
        return Stack(
          fit: StackFit.expand,
          children: [
            PageStorage(
              bucket: fixturesScreenBloc.pageStorageBucket,
              child: buildFixturesComponent(fixturesTabSnapshot.data!),
            ),
            Positioned(
              bottom: 32.0,
              left: 0.0,
              right: 0.0,
              child: FloatSelectionTabBar(
                selectedTab: FixturesTab.finished,
                onChanged: fixturesScreenBloc.onFixturesTabChanged,
              ),
            ),
          ],
        );
      }
    );
  }

  Widget buildFixturesComponent(FixturesTab tab) {
    switch(tab) {
      case FixturesTab.finished:
        return buildFinishedFixturesWidget();

      case FixturesTab.upcoming:
        return buildUpcomingFixturesWidget();
    }
  }

  buildFinishedFixturesWidget() {
    if(fixturesScreenBloc.finishedFixtures.isEmpty) {
      return ErrorPlaceholderWidget(fixtureLocal.translate(FixtureSubtitlesKeys.noResultsFound));
    }

    return ResultListingWidget<FixtureDetails>(
      key: PageStorageKey<String>(FixturesTab.finished.toString()),
      items: fixturesScreenBloc.finishedFixtures,
      listItemBuilder: (context, item) => FixtureCard(item),
    );
  }

  buildUpcomingFixturesWidget() {
    if(fixturesScreenBloc.upcomingFixtures.isEmpty) {
      return ErrorPlaceholderWidget(fixtureLocal.translate(FixtureSubtitlesKeys.noResultsFound));
    }

    return ResultListingWidget<FixtureDetails>(
      key: PageStorageKey<String>(FixturesTab.upcoming.toString()),
      items: fixturesScreenBloc.upcomingFixtures,
      listItemBuilder: (context, item) => FixtureCard(item),
    );
  }
}
