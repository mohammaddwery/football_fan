import 'package:flutter/material.dart';

class FixtureDetailsScreenAppbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 212);
    path.quadraticBezierTo(
        size.width / 4, 370, size.width, 250);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}