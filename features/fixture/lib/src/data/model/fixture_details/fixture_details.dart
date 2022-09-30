import '../fixture/fixture.dart';
import '../goals/goals.dart';
import '../league/league.dart';
import '../team/fixture_team/fixture_team.dart';

class FixtureDetails {
  final Fixture fixture;
  final League league;
  final Teams teams;
  final Goals goals;

  const FixtureDetails({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
  });
}