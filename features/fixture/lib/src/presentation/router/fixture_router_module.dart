import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../screens/fixtures/fixtures_screen.dart';

class FixtureRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute> {
        FixtureRoutes.root: MaterialPageRoute(
          builder: (_) => const FixturesScreen(),
          settings: settings,
        ),

      };
}
