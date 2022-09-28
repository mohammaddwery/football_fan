import 'package:flutter/material.dart';

// TODO: Need REFACTORING
class AppColors {
  static const Color secondary = Color(0xFF20CE31);
  static const Color textSecondaryBody = Color(0xFF989898);
  static const Color backgroundLight = Color(0xFFFBFBFB);
  static const Color secondaryBody = Color(0xFF989898);
  static const Color cardLight = Color(0xFF414141);
  static const Color dividerColor = Color(0xFF9C9C9C);
  static const Color primaryLight = Color.fromARGB(255, 7, 154, 22);


  static get cardShadow => <BoxShadow>[
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 12,
      spreadRadius: 0,
      offset: const Offset(0.0, 1.0,),
    ),
  ];
}