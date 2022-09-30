import 'package:core/core.dart';

import '../status/status_adapter.dart';
import 'fixture.dart';

Fixture adaptJsonToFixture(json) => Fixture(
  id: json['id'],
  date: DateTime.parse(json['date'],).toLocal(),
  referee: json['referee'],
  status: adaptJsonToStatus(json['status']),
);

adaptToFixtureToJson(Fixture fixture) => {
  "id": fixture.id,
  "date": fixture.date.toString(),
  "referee": fixture.referee,
  "status": adaptToStatusToJson(fixture.status)
};
