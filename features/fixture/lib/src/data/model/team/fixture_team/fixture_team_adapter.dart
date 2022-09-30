import 'package:fixture/src/data/model/team/fixture_team/fixture_team.dart';

FixtureTeam adaptJsonToFixtureTeam(json) => FixtureTeam(
  id: json['id'],
  name: json['name'],
  logo: json['logo'],
);
adaptFixtureTeamToJson(FixtureTeam team) => {
  "id": team.id,
  "name": team.name,
  "logo": team.logo
};

Teams adaptJsonToTeams(json) => Teams(
  home: adaptJsonToFixtureTeam(json['home']),
  away: adaptJsonToFixtureTeam(json['away']),
);

adaptTeamsToJson(Teams teams) => {
  "home": adaptFixtureTeamToJson(teams.home),
  "away": adaptFixtureTeamToJson(teams.away),
};