import 'package:agua_coach_app/core/db/db_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClient implements IDbClient {
  final SharedPreferences sharedPreferences;

  SharedPreferencesClient({required this.sharedPreferences});

  @override
  Future<void> setBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool> getBool(String key) async {
    return sharedPreferences.getBool(key) ?? false;
  }

  @override
  Future<void> setInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  @override
  Future<int> getInt(String key) async {
    return sharedPreferences.getInt(key) ?? 0;
  }
}
