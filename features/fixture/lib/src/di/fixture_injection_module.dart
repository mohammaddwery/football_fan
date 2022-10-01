import 'dart:async';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:fixture/src/data/data_resource/local/fixture/fixture_preferences_store.dart';
import 'package:fixture/src/data/data_resource/local/fixture/fixture_store.dart';
import 'package:fixture/src/data/data_resource/remote/fixture/fixture_api_provider.dart';
import 'package:fixture/src/data/repository/fixture_repository_impl.dart';
import 'package:fixture/src/domain/use_case/fetch_local_fixture_details_use_case.dart';
import 'package:fixture/src/domain/use_case/save_local_fixture_details_use_case.dart';
import 'package:fixture/src/presentation/widgets/fixtures_screen_header/fixtures_screen_header_bloc.dart';
import 'package:fixture/src/presentation/widgets/lineup_widget/lineup_widget_bloc.dart';
import 'package:shared_data/shared_data.dart';
import '../domain/repository/fixture_repository.dart';
import '../domain/use_case/fetch_lineup_List_use_case.dart';
import '../domain/use_case/fetch_remote_fixtures_details_list_use_case.dart';
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
      ..registerFactory(() => FixtureApiProvider(
          apiManager: injector.get<DioApiManager>(),
      ))
      ..registerFactory<FixtureStore>(() => FixturePreferencesStore(
        preferencesManager: injector.get(),
      ))
      ..registerFactory<FixtureRepository>(() => FixtureRepositoryImpl(
        apiProvider: injector.get<FixtureApiProvider>(),
        fixtureStore: injector.get(),
      ))
        // DOMAIN
      ..registerFactory(() => FetchRemoteFixtureDetailsListUseCase(
        fixtureRepository: injector.get(),
      ),)
      ..registerFactory(() => FetchLocalFixtureDetailsUseCase(
        fixtureRepository: injector.get(),
      ),)
      ..registerFactory(() => SaveLocalFixtureDetailsUseCase(
        fixtureRepository: injector.get(),
      ),)
      ..registerFactory(() => FetchLineupListUseCase(
        fixtureRepository: injector.get(),
      ),)
        // PRESENTATION
      ..registerFactory(() => FixturesScreenBloc(
        fetchRemoteFixturesUseCase: injector.get(),
        fetchLocalFixtureDetailsUseCase: injector.get(),
        saveLocalFixtureDetailsUseCase: injector.get(),
      ),)
      ..registerFactory(() => FixturesScreenHeaderBloc(),)
      ..registerFactoryParam((param1, _) => FloatSelectionTabBarBloc(
        selectedTab: param1,
      ),)
      ..registerFactoryParam((fixtureId, _) => LineupWidgetBloc(
        fixtureId: fixtureId,
        fetchLineupListUseCase: injector.get(),
      ))
      ..registerFactory<FixtureNavigator>(() => AppFixtureNavigator(),)
    ;
  }
}
