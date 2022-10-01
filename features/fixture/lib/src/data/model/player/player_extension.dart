import 'package:fixture/src/data/model/player/player.dart';

extension PlayerExtension on Player {
  String get formattedName => name.split(" ").take(2).join('\n');
}