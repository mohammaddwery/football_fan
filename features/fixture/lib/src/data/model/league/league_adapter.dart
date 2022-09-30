import 'league.dart';

League adaptJsonToLeague(json) => League(
  id: json['id'],
  name: json['name'],
  logo: json['logo'],
  flag: json['flag'],
);

adaptLeagueToJson(League league) => {
  "id": league.id,
  "name": league.name,
  "logo": league.logo,
  "flag": league.flag
};