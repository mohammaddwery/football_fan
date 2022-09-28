class ApiUtils {
  static removeNullMapObjects(Map? map) {
    map?.removeWhere((key, value) => key == null || value == null);
  }

  static String buildApiQuery(Map<String, dynamic> map) {
    _getQueryPart(key, value) {
      return value != null && value != "" ? "$key=$value" : "";
    }

    String searchQuery = '';
    map.forEach((key, value) {
      String queryPart = _getQueryPart(key, value);
      if (searchQuery.isNotEmpty) {
        searchQuery = queryPart.isNotEmpty ? '$searchQuery&$queryPart' : searchQuery;
      } else {
          searchQuery = queryPart.isNotEmpty ? '$searchQuery?$queryPart' : searchQuery;
        }
    });
    return searchQuery;
  }
}