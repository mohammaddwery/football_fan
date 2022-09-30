import 'package:common_dependencies/common_dependencies.dart';
import '../../../core/enum.dart';

class FloatSelectionTabBarBloc {
  final FixturesTab _selectedTab;
  FloatSelectionTabBarBloc({required selectedTab}): _selectedTab = selectedTab {
    setSelectedTab(_selectedTab);
  }

  final BehaviorSubject<FixturesTab> _selectedTabController = BehaviorSubject();
  ValueStream<FixturesTab> get selectedTabStream => _selectedTabController.stream;
  FixturesTab getSelectedTab() => _selectedTabController.value;
  void setSelectedTab(FixturesTab tab) => _selectedTabController.sink.add(tab);

  onTabChanged({
    required FixturesTab tab,
    required Function(FixturesTab tab) onDoneCallback,
  }) {
    setSelectedTab(tab);
    onDoneCallback(tab);
  }

  dispose() {
    _selectedTabController.close();
  }
}