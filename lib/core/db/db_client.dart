abstract class IDbClient {
  Future<void> setBool(String key, bool value);
  Future<bool> getBool(String key);

  Future<void> setInt(String key, int value);
  Future<int> getInt(String key);
}
