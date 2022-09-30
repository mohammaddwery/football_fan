import 'package:core/core.dart';
import 'package:fixture/src/data/model/local_fixture_details/locale_fixture_details.dart';
import '../repository/fixture_repository.dart';

class FetchLocalFixtureDetailsUseCase extends UseCase<LocalFixtureDetails, NoParams> {
  final FixtureRepository _fixtureRepository;
  FetchLocalFixtureDetailsUseCase({required FixtureRepository fixtureRepository}): _fixtureRepository = fixtureRepository;

  @override
  Future<LocalFixtureDetails> call(NoParams param) async {
    return await Future(() => _fixtureRepository.fetchLocalFixtures());
  }
}