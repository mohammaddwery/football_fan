import 'package:core/core.dart';
import 'package:fixture/src/data/model/lineup/lineup_adapter.dart';
import '../../data/model/lineup/lineup.dart';
import '../repository/fixture_repository.dart';

class FetchLineupListUseCase extends UseCase<List<Lineup>, int> {
  final FixtureRepository _fixtureRepository;
  FetchLineupListUseCase({required FixtureRepository fixtureRepository})
      : _fixtureRepository = fixtureRepository;

  @override
  Future<List<Lineup>> call(int param) async {
    final response = await _fixtureRepository.fetchLineupList(param);
    return adaptJsonToLineupList(response['response']);
  }

}