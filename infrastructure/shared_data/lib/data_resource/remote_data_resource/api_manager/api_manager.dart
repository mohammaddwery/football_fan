mixin ApiManager {
  void close({bool force=false});
  Future<dynamic> get({
    Map<String, String?> headers = const {},
    required String url,
  });
}