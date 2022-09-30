import 'package:core/core.dart';
import '../../core/fixture_constants.dart';
import 'fixture_localization.dart';

final fixtureLocalizationDelegate = FixtureLocalizationDelegate(
  getPathFunction: (locale) => getTranslationFilePath(packageName: FixtureConstants.packageName , locale: locale),
  supportedLocales: appSupportedLocales,
);
