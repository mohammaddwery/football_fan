import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../../ui_state.dart';

abstract class BaseResultsListingWidgetBloc<T> {

  static const logTag = 'BaseResultsListingWidgetBloc';

  void dispose() {
    _listItemsController.close();
  }

  final BehaviorSubject<UiState<List<T>>?> _listItemsController = BehaviorSubject();
  ValueStream<UiState<List<T>>?> get listItemsStream => _listItemsController.stream;
  UiState<List<T>>? getListItems() => _listItemsController.valueOrNull;
  void setListItems(UiState<List<T>>? uiState) => _listItemsController.sink.add(uiState);

  fetchListItems({
    Function()? onData,
    Function(String message)? onError,
  });

  handleResultListRequest({
    required UiState<List<T>>? Function() getCurrentState,
    required Function(UiState<List<T>>? uiState) setCurrentState,
    required Future<List<T>> Function() getResponseResult,
    String? exceptionTag,
    Function(String)? onError,
    Function()? onData,
  }) async {
    try {
      UiState<List<T>>? uiState;
      if(getCurrentState()?.data?.isEmpty??true) {
        uiState = UiState.loading();
        setCurrentState(uiState);
      }
      List<T> result = await getResponseResult();
      if (result.isNotEmpty) {
        uiState = UiState.success(result);
      } else {
        uiState = UiState.noResults();
      }
      setCurrentState(uiState);
      if(onData!=null) onData();
    } on FormatException catch (error) {
      _handleExceptionError(
        debugPrintMessage: '$logTag: $exceptionTag FormatException: ${error.message}',
        message: error.message,
        setCurrentState: setCurrentState,
        getCurrentState: getCurrentState,
        onError: onError,
      );
    } catch (error) {
      _handleExceptionError(
        debugPrintMessage: '$logTag: $exceptionTag $error',
        message: AppConstants.generalErrorMessageKey,
        setCurrentState: setCurrentState,
        getCurrentState: getCurrentState,
        onError: onError,
      );
    }
  }

  _handleExceptionError({
    required String message,
    required String debugPrintMessage,
    Function(UiState<List<T>>? uiState)? setCurrentState,
    UiState<List<T>>? Function()? getCurrentState,
    Function(String)? onError,
  }) {
    debugPrint(debugPrintMessage);
    if(getCurrentState!=null && getCurrentState()?.data==null && setCurrentState!=null) {
      UiState<List<T>> uiState = UiState.failure(message,);
      setCurrentState(uiState);
    }
    if (onError != null) onError(message);
  }
}