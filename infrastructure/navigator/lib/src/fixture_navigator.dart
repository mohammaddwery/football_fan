
import 'package:flutter/material.dart';

class FixtureRoutes {
  FixtureRoutes._();

  static const String root = '/';
  static const String details = '/details';
}

abstract class FixtureNavigator {
  navigateToDetails<A>(BuildContext context, A argument);
}
