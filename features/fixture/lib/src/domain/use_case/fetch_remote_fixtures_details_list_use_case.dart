import 'package:core/core.dart';
import 'package:fixture/src/data/model/fixture_details/fixture_details_adapter.dart';
import 'package:fixture/src/domain/repository/fixture_repository.dart';
import '../../data/model/fixture_details/fixture_details.dart';

class FetchRemoteFixtureDetailsListUseCase extends UseCase<List<FixtureDetails>, NoParams> {
  final FixtureRepository _fixtureRepository;
  FetchRemoteFixtureDetailsListUseCase({required FixtureRepository fixtureRepository}): _fixtureRepository = fixtureRepository;

  @override
  Future<List<FixtureDetails>> call(NoParams param) async {
    final response = await _fixtureRepository.fetchRemoteFixtures();
    return adaptJsonToFixtureDetailsList(response['response']);
  }
}