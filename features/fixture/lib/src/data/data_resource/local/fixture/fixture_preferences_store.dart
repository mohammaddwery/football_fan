import 'package:shared_data/shared_data.dart';
import '../../../model/local_fixture_details/local_fixture_details_adapter.dart';
import '../../../model/local_fixture_details/locale_fixture_details.dart';
import 'fixture_store.dart';

class FixturePreferencesStore with FixtureStore {
  final SharedPreferencesManager _preferencesManager;
  FixturePreferencesStore({required SharedPreferencesManager preferencesManager,})
      : _preferencesManager = preferencesManager;

  static const String _fixturesKey = 'fixturesKey';

  // CREATE
  @override
  Future<bool> saveFixtures(LocalFixtureDetails localFixtureDetails) async {
    return await _preferencesManager.save(_fixturesKey, adaptLocalFixtureDetailsToString(localFixtureDetails));
  }

  // READ
  @override
  LocalFixtureDetails fetchFixtures() {
    final response = _preferencesManager.fetchDecodedJson(_fixturesKey);
    return adaptJsonToLocalFixtureDetails(response);
  }
}