import 'package:fixture/src/data/data_resource/remote/fixture/fixture_endpoints.dart';
import 'package:shared_data/shared_data.dart';

class FixtureApiProvider {
  final ApiManager _apiManager;
  FixtureApiProvider({required ApiManager apiManager}): _apiManager = apiManager;

  Future<dynamic> fetchFixtures() async {
    final query = ApiUtils.buildApiQuery({
      "season": 2022,
      "league": 2,
      "from": "2022-09-10",
      "to": "2022-10-20"
    });
    final String url = '${FixtureEndpoints.getFixtures}$query';
    return await _apiManager.get(url: url,);
  }
}