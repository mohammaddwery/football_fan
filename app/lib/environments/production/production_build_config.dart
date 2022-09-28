import 'package:core/core.dart';

class ProductionBuildConfig extends BuildConfig {
  ProductionBuildConfig(): super(
    configs: {
      BuildConfig.apiBaseUrlKey: 'https://v3.football.api-sports.io/',
    },
    environmentType: EnvironmentType.production,
  );
}
