import 'package:agua_coach_app/core/permissions/request_local_notification_permission.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterLocalNotificationsPlugin extends Mock implements FlutterLocalNotificationsPlugin {}

class MockIOSFlutterLocalNotificationsPlugin extends Mock implements IOSFlutterLocalNotificationsPlugin {}

void main() {
  late RequestLocalNotificationPermission permission;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late IOSFlutterLocalNotificationsPlugin mockIOSFlutterLocalNotificationsPlugin;

  setUp(() {
    flutterLocalNotificationsPlugin = MockFlutterLocalNotificationsPlugin();
    mockIOSFlutterLocalNotificationsPlugin = MockIOSFlutterLocalNotificationsPlugin();

    permission = RequestLocalNotificationPermission(
      flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
    );
  });

  test('should return permission', () async {
    when(
      () => mockIOSFlutterLocalNotificationsPlugin.requestPermissions(
        alert: any(
          named: 'alert',
        ),
        badge: any(
          named: 'badge',
        ),
        sound: any(
          named: 'sound',
        ),
      ),
    ).thenAnswer((_) async => true);
    when(
      () => flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>(),
    ).thenReturn(
      mockIOSFlutterLocalNotificationsPlugin,
    );

    final result = await permission();

    expect(result, const Right(true));
    verify(() => mockIOSFlutterLocalNotificationsPlugin.requestPermissions(
          alert: any(
            named: 'alert',
          ),
          badge: any(
            named: 'badge',
          ),
          sound: any(
            named: 'sound',
          ),
        )).called(1);
  });

  test(
    'should return RequestLocalNotificationPermissionFailure when an error occurs in local notifications plugin',
    () async {
      when(
        () =>
            flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>(),
      ).thenThrow(
        Exception(),
      );
      final result = await permission();

      expect(result, Left(RequestLocalNotificationPermissionFailure()));
    },
  );
}
