import 'package:common_dependencies/common_dependencies.dart';
import 'package:fixture/src/data/model/fixture/fixture.dart';
import 'package:fixture/src/data/model/status/status_extension.dart';

extension FixtureExtension on Fixture {
  String get formattedDate => DateFormat('dd-MM-yyy').format(date);
  String get formattedTime => DateFormat('hh:mm a').format(date,);
  bool get isUpcoming => status.isUpcoming;
  bool get isFinished => status.isFinished;
}