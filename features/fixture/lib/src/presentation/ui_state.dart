import '../core/enum.dart';

class UiState<T> {
  UiStateStatus status;
  T? data;
  String? message;

  UiState({
    required this.status,
    this.data,
    this.message,
  });

  static UiState<T> success<T>(T data) {
    return UiState(status: UiStateStatus.success, data: data);
  }

  static UiState<T> failure<T>(String message, {T? oldData}) {
    return UiState(status: UiStateStatus.failure, message: message, data: oldData);
  }

  static UiState<T> loading<T>({T? data,}) {
    return UiState(status: UiStateStatus.loading, data: data,);
  }

  static UiState<T> noResults<T>() {
    return UiState(status: UiStateStatus.noResults);
  }

  static UiState<T> loadingMore<T>(T data) {
    return UiState(status: UiStateStatus.loadingMore, data: data);
  }

  static UiState<T> noMoreResults<T>(T data) {
    return UiState(status: UiStateStatus.noMoreResults, data: data);
  }
}
