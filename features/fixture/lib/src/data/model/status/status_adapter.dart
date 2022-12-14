import 'package:core/core.dart';
import '../../../core/enum.dart';
import 'status.dart';

Status adaptJsonToStatus(json) => Status(
  short: stringToEnum(json['short'], FixtureShortStatus.values)??FixtureShortStatus.NS,
  elapsed: json['elapsed']??0,
);

adaptToStatusToJson(Status status) => {
  "short": enumToString(status.short),
  "elapsed": status.elapsed
};