import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:fixture/src/data/model/fixture_details/fixture_details.dart';
import 'package:flutter/material.dart';
import '../screens/fixture_details/fixture_details_screen.dart';
import '../screens/fixtures/fixtures_screen.dart';

class FixtureRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute> {
        FixtureRoutes.root: MaterialPageRoute(
          builder: (_) => const FixturesScreen(),
          settings: settings,
        ),
        FixtureRoutes.details: MaterialPageRoute(
          builder: (_) => FixtureDetailsScreen(settings.arguments as FixtureDetails),
          settings: settings,
        ),

      };
}
