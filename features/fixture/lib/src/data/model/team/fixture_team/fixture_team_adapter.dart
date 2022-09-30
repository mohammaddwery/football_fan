import 'package:fixture/src/data/model/team/fixture_team/fixture_team.dart';

FixtureTeam adaptJsonToFixtureTeam(json) => FixtureTeam(
  id: json['id'],
  name: json['name'],
  logo: json['logo'],
  winner: json['winner'],
);

Teams adaptJsonToTeams(json) => Teams(
  home: adaptJsonToFixtureTeam(json['home']),
  away: adaptJsonToFixtureTeam(json['away']),
);