import 'package:core/core.dart';
import 'package:fixture/src/data/model/fixture/fixture_adapter.dart';
import 'package:fixture/src/data/model/league/league_adapter.dart';
import 'package:fixture/src/data/model/team/fixture_team/fixture_team_adapter.dart';
import '../goals/goals_adapter.dart';
import 'fixture_details.dart';

List<FixtureDetails> adaptJsonToFixtureDetailsList(json) =>
    List<FixtureDetails>.from(json.map((x) => adaptJsonToFixtureDetails(x)));
dynamic adaptFixtureDetailsListToJson(List<FixtureDetails> data) =>
    List<dynamic>.from(data.map((x) => adaptFixtureDetailsToJson(x)));

FixtureDetails adaptJsonToFixtureDetails(json) => FixtureDetails(
  fixture: adaptJsonToFixture(json['fixture']),
  league: adaptJsonToLeague(json['league']),
  teams: adaptJsonToTeams(json['teams']),
  goals: adaptJsonToGoals(json['goals']),
);
Map<String, dynamic> adaptFixtureDetailsToJson(FixtureDetails fixtureDetails) => {
  "fixture": adaptToFixtureToJson(fixtureDetails.fixture),
  "league": adaptLeagueToJson(fixtureDetails.league),
  "teams": adaptTeamsToJson(fixtureDetails.teams),
  "goals": adaptGoalsToJson(fixtureDetails.goals)
};
