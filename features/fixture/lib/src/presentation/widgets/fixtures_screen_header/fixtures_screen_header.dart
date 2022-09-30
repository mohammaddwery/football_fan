import 'package:core/core.dart';
import 'package:fixture/src/core/fixture_constants.dart';
import 'package:fixture/src/presentation/helpers/fixture_icons.dart';
import 'package:fixture/src/presentation/helpers/fixture_subtitles_keys.dart';
import 'package:fixture/src/presentation/widgets/fixtures_screen_header/fixtures_screen_header_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../core/enum.dart';
import '../../helpers/fixture_images.dart';
import '../base_widget_state.dart';

class FixturesScreenHeader extends StatefulWidget {
  const FixturesScreenHeader({Key? key}) : super(key: key);

  @override
  BaseWidgetState<FixturesScreenHeader> createState() => _FixturesScreenHeaderState();
}

class _FixturesScreenHeaderState extends BaseWidgetState<FixturesScreenHeader> {

  late FixturesScreenHeaderBloc fixturesScreenBloc = AppInjector.I.get();

  @override
  void dispose() {
    fixturesScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return buildHeaderComponents();
  }

  Widget buildHeaderComponents() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              StreamBuilder<FixturesScreenHeaderComponentsAnimationStatus>(
                  initialData: FixturesScreenHeaderComponentsAnimationStatus.started,
                  stream: fixturesScreenBloc.firstComponentAnimationStateStream,
                  builder: (context, statusSnapshot) {
                    return buildAppNameWidget(statusSnapshot);
                  }
              ),
              StreamBuilder<FixturesScreenHeaderComponentsAnimationStatus>(
                  initialData: FixturesScreenHeaderComponentsAnimationStatus.started,
                  stream: fixturesScreenBloc.secondComponentAnimationStateStream,
                  builder: (context, statusSnapshot) {
                    return buildLeagueNameWidget(statusSnapshot);
                  }
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAppNameWidget(statusSnapshot) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AnimatedContainer(
          width: statusSnapshot.data == FixturesScreenHeaderComponentsAnimationStatus.started ? 0.0 : width* .35,
          duration: fixturesScreenBloc.componentAnimationDuration,
          curve: Curves.ease,
          alignment: AlignmentDirectional.bottomEnd,
          child: ClipRRect(
            child: Row(
              children: [
                Text(
                  fixtureLocal.translate(FixtureSubtitlesKeys.footballFan),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width* .35),
          child: AnimatedContainer(
            width: statusSnapshot.data == FixturesScreenHeaderComponentsAnimationStatus.started ? 0.0 : width* .18,
            onEnd: fixturesScreenBloc.onFirstComponentAnimationEnded,
            duration: fixturesScreenBloc.componentAnimationDuration,
            curve: Curves.ease,
            alignment: AlignmentDirectional.bottomEnd,
            child: ClipRRect(
              child: Row(
                children: [
                  ImageWidget(
                    packageName: FixtureConstants.packageName,
                    url: FixtureIcons.icFootball,
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  

  Widget buildLeagueNameWidget(statusSnapshot) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AnimatedContainer(
          width: statusSnapshot.data == FixturesScreenHeaderComponentsAnimationStatus.started ? 0.0 : width* .65,
          duration: fixturesScreenBloc.componentAnimationDuration,
          curve: Curves.ease,
          alignment: AlignmentDirectional.bottomEnd,
          child: ClipRRect(
            child: Row(
              children: [
                Text(
                  'UEFA Champions League',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width* .65),
          child: AnimatedContainer(
            width: statusSnapshot.data == FixturesScreenHeaderComponentsAnimationStatus.started ? 0.0 : width* .1,
            onEnd: fixturesScreenBloc.onSecondComponentAnimationEnded,
            duration: fixturesScreenBloc.componentAnimationDuration,
            curve: Curves.ease,
            alignment: AlignmentDirectional.bottomEnd,
            child: ClipRRect(
              child: Row(
                children: [
                  ImageWidget(
                    packageName: FixtureConstants.packageName,
                    url: FixtureImages.icLeague,
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
