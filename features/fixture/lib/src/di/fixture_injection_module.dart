import 'dart:async';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:fixture/src/presentation/widgets/fixtures_screen_header/fixtures_screen_header_bloc.dart';
import '../presentation/router/app_fixture_navigator.dart';
import '../presentation/screens/fixtures/fixtures_screen_bloc.dart';
import '../presentation/widgets/foat_selection_tab_bar/float_selection_tab_bar_bloc.dart';

class FixtureInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    injector
        // DATA

        // DOMAIN

        // PRESENTATION
      ..registerFactory(() => FixturesScreenBloc(
      ),)
      ..registerFactory(() => FixturesScreenHeaderBloc(
      ),)
      ..registerFactoryParam((param1, _) => FloatSelectionTabBarBloc(
        selectedTab: param1,
      ),)
      ..registerFactory<FixtureNavigator>(() => AppFixtureNavigator(),)
    ;
  }
}
