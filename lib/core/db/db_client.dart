abstract class IDbClient {
  Future<void> setBool(String key, bool value);
  Future<bool> getBool(String key);
}
