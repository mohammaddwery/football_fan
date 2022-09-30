import 'package:fixture/src/data/model/local_fixture_details/locale_fixture_details.dart';

extension LocalFixtureDetailsExtension on LocalFixtureDetails {
  bool get isLastSaveTryValid => DateTime.now().difference(lastSaveTry).inHours <= 24;
}