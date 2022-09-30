import '../../../core/enum.dart';
import 'status.dart';

extension StatusExtension on Status {
  bool get isUpcoming => short == FixtureShortStatus.NS;
  bool get isFinished => short == FixtureShortStatus.FT
      || short == FixtureShortStatus.AET
      || short == FixtureShortStatus.PEN;
}