import 'package:agua_coach_app/core/db/db_client.dart';
import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/modules/data/datasources/notification_datasource.dart';
import 'package:agua_coach_app/modules/data/datasources/notification_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockDbClient extends Mock implements IDbClient {}

void main() {
  late INotificationDatasource datasource;
  late IDbClient dbClient;

  setUp(() {
    dbClient = MockDbClient();
    datasource = NotificationDatasourceImpl(dbClient: dbClient);
  });

  group('#setSubscriptionNotification', () {
    test('should set subscription notification on db client', () async {
      when(() => dbClient.setBool(any(), any())).thenAnswer((_) async {});

      await datasource.setSubscriptionNotification(subscribe: true);

      verify(() => dbClient.setBool(any(), any())).called(1);
    });

    test('should throw an SaveOnDbException when occurs error on dbClient', () async {
      when(() => dbClient.setBool(any(), any())).thenThrow(Exception());

      final result = datasource.setSubscriptionNotification(subscribe: true);

      expect(() => result, throwsA(SaveOnDbException()));
    });
  });

  group('#getSubscriptionNotification', () {
    test('should get subscription notification on db client', () async {
      when(() => dbClient.getBool(any())).thenAnswer((_) async => false);

      await datasource.getSubscriptionNotification();

      verify(() => dbClient.getBool(any())).called(1);
    });

    test('should throw an GetOnDbException when occurs error on dbClient', () async {
      when(() => dbClient.getBool(any())).thenThrow(Exception());

      final result = datasource.getSubscriptionNotification();

      expect(() => result, throwsA(GetOnDbException()));
    });
  });
}
