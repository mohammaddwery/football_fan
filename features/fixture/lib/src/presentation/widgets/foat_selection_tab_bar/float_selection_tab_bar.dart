import 'package:core/core.dart';
import 'package:fixture/src/core/enum.dart';
import 'package:fixture/src/presentation/helpers/fixture_subtitles_keys.dart';
import 'package:fixture/src/presentation/widgets/foat_selection_tab_bar/float_selection_tab_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../base_widget_state.dart';
import 'float_selection_tab.dart';

class FloatSelectionTabBar extends StatefulWidget {
  final FixturesTab selectedTab;
  final Function(FixturesTab tab) onChanged;
  FloatSelectionTabBar({required this.selectedTab, required this.onChanged});

  @override
  BaseWidgetState<FloatSelectionTabBar> createState() => _FloatSelectionTabBarState();
}

class _FloatSelectionTabBarState extends BaseWidgetState<FloatSelectionTabBar> {

  late FloatSelectionTabBarBloc floatSelectionTabBarBloc;

  @override
  void initState() {
    floatSelectionTabBarBloc = AppInjector.I.get(param1: widget.selectedTab,);
    super.initState();
  }

  @override
  void dispose() {
    floatSelectionTabBarBloc.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    double barWidth = width* .5;
    double barHeight = 50.0;
    return StreamBuilder<FixturesTab>(
      initialData: FixturesTab.finished,
      stream: floatSelectionTabBarBloc.selectedTabStream,
      builder: (context, fixturesTabSnapshot) {
        return Container(
          height: barHeight*1.2,
          width: barWidth,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: barWidth,
                  height: barHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: AppColors.cardShadow,
                  ),
                ),
              ),
              SizedBox(
                width: barWidth,
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatSelectionTab(
                      onClicked: (FixturesTab tab) => floatSelectionTabBarBloc.onTabChanged(
                        tab: tab,
                        onDoneCallback: widget.onChanged,
                      ),
                      tab: FixturesTab.finished,
                      isSelected: fixturesTabSnapshot.data! == FixturesTab.finished,
                      title: fixtureLocal.translate(FixtureSubtitlesKeys.finished),
                    ),
                    FloatSelectionTab(
                      onClicked: (FixturesTab tab) => floatSelectionTabBarBloc.onTabChanged(
                        tab: tab,
                        onDoneCallback: widget.onChanged,
                      ),
                      tab: FixturesTab.upcoming,
                      isSelected: fixturesTabSnapshot.data! == FixturesTab.upcoming,
                      title: fixtureLocal.translate(FixtureSubtitlesKeys.upcoming),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
