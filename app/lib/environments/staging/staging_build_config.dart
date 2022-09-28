import 'package:core/core.dart';

class StagingBuildConfig extends BuildConfig {
  StagingBuildConfig(): super(
    configs: {
      BuildConfig.apiBaseUrlKey: 'https://v3.football.api-sports.io/',
    },
    environmentType: EnvironmentType.staging,
  );
}
