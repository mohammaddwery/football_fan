
abstract class SharedPreferencesManager {
  Future<bool> save(String key, String data);
  dynamic fetchDecodedJson(String key);
  String fetchString(String key);
  bool isExist(String key);
  Future<bool> delete(String key);
  Future<bool> clearCache();
  bool fetchBool(String key);
  Future<bool>  saveBool(String key, bool data);
}
