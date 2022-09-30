import 'package:core/core.dart';

class StagingBuildConfig extends BuildConfig {
  StagingBuildConfig(): super(
    configs: {
      BuildConfig.apiBaseUrlKey: 'https://v3.football.api-sports.io/',
      BuildConfig.apiKey: 'f3fb7cdc11dab00e3559fde9080f5dea',
    },
    environmentType: EnvironmentType.staging,
  );
}
