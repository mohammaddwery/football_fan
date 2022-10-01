import 'package:core/core.dart';
import 'package:fixture/src/data/model/team/lineup_team/lineup_team.dart';

LineupTeam adaptJsonToLineupTeam(json) => LineupTeam(
  id: json['id'],
  name: json['name'],
  logo: json['logo'],
  colors: adaptJsonToLineupColors(json["colors"]),
);

LineupColors adaptJsonToLineupColors(json) => LineupColors(
  player: adaptJsonToPlayerColor(json["player"]),
  goalKeeper: adaptJsonToPlayerColor(json["goalkeeper"]),
);

PlayerColor adaptJsonToPlayerColor(json) =>  PlayerColor(
  primary: adaptHexColorToColor(json["primary"] ?? "808080"),
  number: adaptHexColorToColor(json["number"] ?? "000000"),
);
