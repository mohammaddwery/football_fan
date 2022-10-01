import 'package:fixture/src/data/model/lineup/lineup.dart';
import '../player/player_adapter.dart';
import '../team/lineup_team/lineup_team_adapter.dart';

List<Lineup> adaptJsonToLineupList(json) =>
    List<Lineup>.from(json.map((x) => adaptJsonToLineup(x)));

Lineup adaptJsonToLineup(json) => Lineup(
  team: adaptJsonToLineupTeam(json['team']),
  formation: json["formation"],
  startXI: adaptJsonToPlayers(json["startXI"]),
);