import 'package:core/core.dart';

class DevelopmentBuildConfig extends BuildConfig {
  DevelopmentBuildConfig(): super(
    configs: {
      BuildConfig.apiBaseUrlKey: 'https://v3.football.api-sports.io/',
    },
    environmentType: EnvironmentType.development,
  );
}
