import 'package:fixture/src/data/model/local_fixture_details/locale_fixture_details.dart';
import '../../domain/repository/fixture_repository.dart';
import '../data_resource/local/fixture/fixture_store.dart';
import '../data_resource/remote/fixture/fixture_api_provider.dart';

class FixtureRepositoryImpl extends FixtureRepository {
  final FixtureApiProvider _apiProvider;
  final FixtureStore _fixtureStore;
  FixtureRepositoryImpl({
    required FixtureApiProvider apiProvider,
    required FixtureStore fixtureStore,
  }): _apiProvider = apiProvider, _fixtureStore = fixtureStore;

  @override
  Future<dynamic> fetchRemoteFixtures() => _apiProvider.fetchFixtures();

  @override
  LocalFixtureDetails fetchLocalFixtures() => _fixtureStore.fetchFixtures();

  @override
  Future<bool> saveLocalFixtures(LocalFixtureDetails localFixtureDetails) =>
      _fixtureStore.saveFixtures(localFixtureDetails);
}