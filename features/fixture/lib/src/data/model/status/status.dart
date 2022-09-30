import '../../../core/enum.dart';

class Status {
  final FixtureShortStatus short;
  final int? elapsed;

  const Status({
    required this.short,
    this.elapsed,
  });
}