
import 'package:fixture/src/data/model/local_fixture_details/locale_fixture_details.dart';

abstract class FixtureRepository {
  Future<dynamic> fetchRemoteFixtures();
  LocalFixtureDetails fetchLocalFixtures();
  Future<bool> saveLocalFixtures(LocalFixtureDetails localFixtureDetails);
  Future<dynamic> fetchLineupList(int fixtureId);
}