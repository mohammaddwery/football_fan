import 'goals.dart';

Goals adaptJsonToGoals(json) => Goals(
  home: json['home'],
  away: json['away'],
);