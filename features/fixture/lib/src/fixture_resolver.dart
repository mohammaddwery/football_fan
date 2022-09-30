import 'package:core/core.dart';
import 'package:fixture/src/presentation/localization/fixtures_delegate.dart';
import 'package:flutter/material.dart';
import 'di/fixture_injection_module.dart';
import 'presentation/router/fixture_router_module.dart';

class FixtureResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => FixtureInjectionModule();

  @override
  RouterModule? get routerModule => FixtureRouterModule();

  @override
  LocalizationsDelegate? get localeDelegate => fixtureLocalizationDelegate;
}
