import 'package:fixture/src/data/model/player/player.dart';

List<Player> adaptJsonToPlayers(json) =>
    List<Player>.from(json.map((x) => adaptJsonToPlayer(x["player"])));

Player adaptJsonToPlayer(json) => Player(
  id: json["id"]??-1,
  name: json["name"]??"",
  number: json["number"]??0,
);