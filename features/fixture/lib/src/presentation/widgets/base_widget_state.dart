import 'package:flutter/widgets.dart';
import '../localization/fixture_localization.dart';

abstract class BaseWidgetState<ScreenWidget extends StatefulWidget>
    extends State<ScreenWidget>
    with WidgetsBindingObserver {

  late double width;
  late double height;
  late String lang;
  late FixtureLocalization fixtureLocal;
  late MediaQueryData mediaQuery;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      mediaQuery = MediaQuery.of(context);
      width = MediaQuery.of(context).size.width;
      fixtureLocal = FixtureLocalization.of(context);
      lang = fixtureLocal.locale.languageCode;
      height = MediaQuery.of(context).size.height;
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildContent(context);
  }

  Widget buildContent(BuildContext context);
}
