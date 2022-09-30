import 'league.dart';

League adaptJsonToLeague(json) => League(
  id: json['id'],
  name: json['name'],
  logo: json['logo'],
  flag: json['flag'],
  season: json['season'],
  round: json['round'],
);