import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';

abstract class BaseResultsListingWidgetBloc<T> extends BaseBloc<T> {

  static const logTag = 'BaseResultsListingWidgetBloc';

  @override
  void dispose() {
    _listItemsController.close();
  }

  final BehaviorSubject<UiState<List<T>>?> _listItemsController = BehaviorSubject();
  ValueStream<UiState<List<T>>?> get listItemsStream => _listItemsController.stream;
  UiState<List<T>>? getListItems() => _listItemsController.valueOrNull;
  void setListItems(UiState<List<T>>? uiState) => _listItemsController.sink.add(uiState);

  fetchRemoteListItems();
  fetchLocalListItems();
}