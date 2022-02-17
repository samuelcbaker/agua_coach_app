import 'package:agua_coach_app/core/db/db_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClient implements DbClient {
  final SharedPreferences sharedPreferences;

  SharedPreferencesClient({required this.sharedPreferences});

  @override
  Future<void> setBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }
}
