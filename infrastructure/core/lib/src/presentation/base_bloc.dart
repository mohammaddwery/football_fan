import '../app_constants.dart';
import 'ui_state.dart';
import 'package:flutter/material.dart';

abstract class BaseBloc<T> {
  handleResultListRequest({
    required UiState<List<T>>? Function() getCurrentState,
    required Function(UiState<List<T>>? uiState) setCurrentState,
    required Future<List<T>> Function() getResponseResult,
    String? exceptionTag,
    Function(String)? onError,
    Function(List<T> items)? onData,
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
      if(onData!=null) onData(result);
    } on FormatException catch (error) {
      _handleExceptionError(
        debugPrintMessage: '$exceptionTag FormatException: ${error.message}',
        message: error.message,
        setCurrentState: setCurrentState,
        getCurrentState: getCurrentState,
        onError: onError,
      );
    } catch (error) {
      _handleExceptionError(
        debugPrintMessage: '$exceptionTag $error',
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
    required UiState<List<T>>? Function() getCurrentState,
    Function(String)? onError,
  }) {
    debugPrint(debugPrintMessage);
    if(getCurrentState()?.data==null && setCurrentState!=null) {
      UiState<List<T>> uiState = UiState.failure(message,);
      setCurrentState(uiState);
    }
    if (onError != null) onError(message);
  }

  dispose();
}