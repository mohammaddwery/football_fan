import '../team.dart';

class Teams {
  final FixtureTeam home;
  final FixtureTeam away;
  const Teams({
    required this.home,
    required this.away,
  });
}

class FixtureTeam extends Team {
  const FixtureTeam({
    required super.id,
    required super.name,
    required super.logo,
  });
}
