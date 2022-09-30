import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class FixtureLocalization extends BaseLocalization {
  FixtureLocalization({
    required this.appLocale,
    required this.appPathFunction,
  }) : super(appPathFunction: appPathFunction, locale: appLocale);
  @override
  // ignore: overridden_fields
  final String Function(Locale locale) appPathFunction;
  final Locale appLocale;
  static FixtureLocalization of(BuildContext context) =>
      Localizations.of<FixtureLocalization>(context, FixtureLocalization)!;
}

class FixtureLocalizationDelegate extends LocalizationsDelegate<FixtureLocalization> {
  FixtureLocalizationDelegate({
    required this.supportedLocales,
    required this.getPathFunction,
  });

  final List<Locale> supportedLocales;
  final String Function(Locale locale) getPathFunction;
  late Locale locale;

  @override
  bool isSupported(Locale locale) =>
      getSupportedLocaleForLanguageCode(supportedLocales, locale) != null;

  @override
  Future<FixtureLocalization> load(Locale locale) async {
    this.locale = locale;
    final localization = FixtureLocalization(
      appLocale: locale,
      appPathFunction: getPathFunction,
    );

    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(FixtureLocalizationDelegate old) => old.locale != locale;
}
