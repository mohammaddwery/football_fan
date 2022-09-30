import '../status/status_adapter.dart';
import 'fixture.dart';

Fixture adaptJsonToFixture(json) => Fixture(
  id: json['id']??'',
  date: DateTime.parse(json['date'],),
  referee: json['referee']??'',
  status: adaptJsonToStatus(json['status']),
);