import 'package:agua_coach_app/core/db/shared_preferences_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferencesClient client;
  late SharedPreferences sharedPreferences;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    client = SharedPreferencesClient(sharedPreferences: sharedPreferences);
  });

  group('#setBool', () {
    test('should set bool on shared preferences', () async {
      when(
        () => sharedPreferences.setBool(
          any(),
          any(),
        ),
      ).thenAnswer(
        (_) async => true,
      );

      await client.setBool('key', true);

      verify(() => sharedPreferences.setBool('key', true)).called(1);
    });
  });

  group('#getBool', () {
    test('should return a boolean value from shared preferences', () async {
      when(
        () => sharedPreferences.getBool(
          any(),
        ),
      ).thenAnswer(
        (_) => true,
      );

      final result = await client.getBool('key');

      expect(result, true);
      verify(() => sharedPreferences.getBool('key')).called(1);
    });
  });
}
