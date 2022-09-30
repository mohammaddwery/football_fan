import 'package:core/core.dart';
import 'package:fixture/src/data/model/local_fixture_details/locale_fixture_details.dart';
import '../repository/fixture_repository.dart';

class SaveLocalFixtureDetailsUseCase extends UseCase<bool, LocalFixtureDetails> {
  final FixtureRepository _fixtureRepository;
  SaveLocalFixtureDetailsUseCase({required FixtureRepository fixtureRepository}):
        _fixtureRepository = fixtureRepository;

  @override
  Future<bool> call(LocalFixtureDetails param) async {
    return await _fixtureRepository.saveLocalFixtures(param);
  }
}