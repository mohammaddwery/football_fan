import 'package:fixture/src/data/model/fixture_details/fixture_details.dart';

class LocalFixtureDetails {
  final List<FixtureDetails> fixtureDetailsList;
  final DateTime lastSaveTry;
  LocalFixtureDetails({
    required this.fixtureDetailsList,
    required this.lastSaveTry,
  });
}