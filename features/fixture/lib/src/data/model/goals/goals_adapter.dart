import 'goals.dart';

Goals adaptJsonToGoals(json) => Goals(
  home: json['home']??0,
  away: json['away']??0,
);

adaptGoalsToJson(Goals goals) => {
  "home": goals.home,
  "away": goals.away
};