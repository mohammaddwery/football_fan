import '../status/status.dart';

class Fixture {
  final int id;
  final DateTime date;
  final String? referee;
  final Status status;

  const Fixture({
    required this.id,
    required this.date,
    this.referee,
    required this.status,
  });
}