import 'package:fixture/src/data/model/team/lineup_team/lineup_team.dart';
import '../player/player.dart';

class Lineup {
  final LineupTeam team;
  final String formation;
  final List<Player> startXI;

  const Lineup({
    required this.team,
    required this.formation,
    required this.startXI,
  });
}