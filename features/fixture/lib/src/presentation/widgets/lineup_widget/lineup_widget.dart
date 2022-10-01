import 'package:core/core.dart';
import 'package:fixture/src/core/fixture_constants.dart';
import 'package:fixture/src/data/model/player/player_extension.dart';
import 'package:fixture/src/presentation/helpers/fixture_images.dart';
import 'package:fixture/src/presentation/widgets/base_widget_state.dart';
import 'package:fixture/src/presentation/widgets/lineup_widget/lineup_player.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../data/model/lineup/lineup.dart';
import '../../../data/model/player/player.dart';
import '../../../data/model/team/lineup_team/lineup_team.dart';
import '../../helpers/fixture_subtitles_keys.dart';
import 'lineup_widget_bloc.dart';

class LineupWidget extends StatefulWidget {
  final int fixtureId;
  LineupWidget(this.fixtureId);

  @override
  BaseWidgetState<LineupWidget> createState() => _LineupWidgetState();
}

class _LineupWidgetState extends BaseWidgetState<LineupWidget> {

  late LineupWidgetBloc lineupWidgetBloc = AppInjector.I.get(param1: widget.fixtureId);

  @override
  Widget buildContent(BuildContext context) {
    return StreamBuilder<UiState<List<Lineup>>?>(
      stream: lineupWidgetBloc.lineupListStream,
      builder: (context, lineUpListSnapshot) {
        switch (lineUpListSnapshot.data?.status) {
          case UiStateStatus.loading:
            return LoadingWidget();
          case UiStateStatus.success:
            return buildTeamLineups(lineUpListSnapshot.data!.data!);
          case UiStateStatus.noResults:
            return ErrorPlaceholderWidget(fixtureLocal.translate(FixtureSubtitlesKeys.noResultsFound));
          case UiStateStatus.failure:
            return ErrorPlaceholderWidget(
              lineUpListSnapshot.data!.message!,
            );

          default:
            return Container();
        }
      },
    );
  }

  Widget buildTeamLineups(List<Lineup> lineupList) {
    return Container(
      width: double.infinity,
      height: 630,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            FixtureImages.playground,
            package: FixtureConstants.packageName,
          ),
        ),
      ),
      child: Column(
        children: [
          buildHomeLineup(lineupList[0]),
          buildAwayLineup(lineupList[1]),
        ],
      ),
    );
  }

  Widget buildHomeLineup(Lineup lineup) {
    List<Player> players = lineup.startXI;
    List<int> formations = lineup.formation.split("-")
        .map((element) => int.parse(element))
        .toList();
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LineupPlayer(
            name: players.first.name,
            number: players.first.number,
            playerColor: lineup.team.colors.goalKeeper,
          ),
          buildTeamLineupList(
            players: players.skip(1).toList(),
            formations: formations,
            playerColor: lineup.team.colors.player,
          ),
        ],
      ),
    );
  }

  Widget buildAwayLineup(Lineup lineup) {
    List<Player> players = lineup.startXI.reversed.toList();
    List<int> formations = lineup.formation.split("-")
        .reversed
        .map((element) => int.parse(element))
        .toList();
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTeamLineupList(
            players: players.take(10).toList(),
            formations: formations,
            playerColor: lineup.team.colors.player,
          ),
          LineupPlayer(
            name: players.last.name,
            number: players.last.number,
            playerColor: lineup.team.colors.goalKeeper,
          ),
        ],
      ),
    );
  }

  Widget buildTeamLineupList({
    required List<Player> players,
    required List<int> formations,
    required PlayerColor playerColor,
  }) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: formations.length,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, formationDigitsIndex) {
        int linePlayers = formations[formationDigitsIndex];
        return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          linePlayers, (linePlayersIndex) {

            int index = lineupWidgetBloc.calculateCurrentPlayerIndex(
              formations: formations,
              formationDigitsIndex: formationDigitsIndex,
              linePlayersIndex: linePlayersIndex,
            );

            return Expanded(
              child: Column(
                children: [
                  LineupPlayer(
                    name: players[index].formattedName,
                    number: players[index].number,
                    playerColor: playerColor,
                  ),
                ],
              ),
            );
          },
        ),
      );
        },
    );
  }

}
