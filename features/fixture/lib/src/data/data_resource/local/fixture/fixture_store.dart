import '../../../model/local_fixture_details/locale_fixture_details.dart';

abstract class FixtureStore {
  Future<bool> saveFixtures(LocalFixtureDetails localFixtureDetails);
  LocalFixtureDetails fetchFixtures();
}