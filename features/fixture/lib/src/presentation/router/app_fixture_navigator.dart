import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class AppFixtureNavigator with AppNavigator implements FixtureNavigator {
  @override
  navigateToDetails<T>(BuildContext context, T arguments) => navigateTo(
    context: context,
    routeName: FixtureRoutes.details,
    arguments: arguments,
  );

}
