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

    test('should return false when share preferences return a null value', () async {
      when(
        () => sharedPreferences.getBool(any()),
      ).thenAnswer(
        (_) => null,
      );

      final result = await client.getBool('key');

      expect(result, false);
      verify(() => sharedPreferences.getBool('key')).called(1);
    });
  });

  group('#setInt', () {
    test('should set int on shared preferences', () async {
      when(
        () => sharedPreferences.setInt(
          any(),
          any(),
        ),
      ).thenAnswer(
        (_) async => true,
      );

      await client.setInt('key', 1);

      verify(() => sharedPreferences.setInt('key', 1)).called(1);
    });
  });

  group('#getInt', () {
    test('should return an int value from shared preferences', () async {
      when(
        () => sharedPreferences.getInt(
          any(),
        ),
      ).thenAnswer(
        (_) => 1,
      );

      final result = await client.getInt('key');

      expect(result, 1);
      verify(() => sharedPreferences.getInt('key')).called(1);
    });

    test('should return 0 when share preferences return a null value', () async {
      when(
        () => sharedPreferences.getInt(any()),
      ).thenAnswer(
        (_) => null,
      );

      final result = await client.getInt('key');

      expect(result, 0);
      verify(() => sharedPreferences.getInt('key')).called(1);
    });
  });
}
