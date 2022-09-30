import 'package:core/core.dart';
import 'package:fixture/src/data/model/fixture_details/fixture_details_adapter.dart';
import '../fixture_details/fixture_details.dart';
import 'locale_fixture_details.dart';

LocalFixtureDetails adaptJsonToLocalFixtureDetails(json) => LocalFixtureDetails(
  fixtureDetailsList: adaptJsonToFixtureDetailsList(json["fixtureDetailsList"]),
  lastSaveTry: DateTime.parse(json["lastSaveTry"]),
);
Map<String, dynamic> adaptLocalFixtureDetailsToJson(LocalFixtureDetails localFixtureDetails) => {
  "fixtureDetailsList": adaptFixtureDetailsListToJson(localFixtureDetails.fixtureDetailsList),
  "lastSaveTry": localFixtureDetails.lastSaveTry.toString()
};

String adaptLocalFixtureDetailsToString(LocalFixtureDetails localFixtureDetails) =>
    encodeJson(adaptLocalFixtureDetailsToJson(localFixtureDetails));

LocalFixtureDetails adaptFixtureDetailsListToLocalFixtureDetails(
    List<FixtureDetails> fixtureDetailsList,
    ) => LocalFixtureDetails(
  fixtureDetailsList: fixtureDetailsList,
  lastSaveTry: DateTime.now(),
);