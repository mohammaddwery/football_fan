import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../data/model/team/lineup_team/lineup_team.dart';

class LineupPlayer extends StatelessWidget {
  final PlayerColor playerColor;
  final String name;
  final int number;
  LineupPlayer({
    required this.playerColor,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: playerColor.primary,
            border: Border.all(color: Colors.white, width: 1,),
          ),
          child: Text(
            '$number',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: playerColor.number,),
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          name,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: AppFonts.size12, fontWeight: FontWeight.w600,),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
