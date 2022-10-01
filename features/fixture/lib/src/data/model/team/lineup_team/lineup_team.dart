import 'package:flutter/material.dart';

import '../team.dart';

class LineupTeam extends Team {
  final LineupColors colors;
  const LineupTeam({
    required super.id,
    required super.name,
    required super.logo,
    required this.colors,
  });
}

class PlayerColor {
  final Color primary;
  final Color number;
  const PlayerColor({
    required this.primary,
    required this.number,
  });
}

class LineupColors {
  final PlayerColor player;
  final PlayerColor goalKeeper;
  const LineupColors({required this.player, required this.goalKeeper});
}