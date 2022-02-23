import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/modules/data/datasources/schedule_notification_datasource.dart';
import 'package:agua_coach_app/modules/data/datasources/schedule_notification_datasource_impl.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

import '../../../test_setup.dart';

class MockFlutterNotificationPlugin extends Mock implements FlutterLocalNotificationsPlugin {}

void main() {
  late IScheduleNotificationDatasource datasource;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  setUpAll(registerFallbackValues);

  setUp(() {
    flutterLocalNotificationsPlugin = MockFlutterNotificationPlugin();

    datasource = ScheduleNotificationDatasourceImpl(
      flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
    );

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Sao_Paulo'));
  });

  final mockNotificationEntity = NotificationEntity(
    id: 1,
    title: 'agua',
    body: 'beba',
    scheduledDateTime: DateTime(2022, 1, 1, 10),
  );

  group('#startDailyScheduleNotification', () {
    test('should return new schedule notification id', () async {
      when(
        () => flutterLocalNotificationsPlugin.zonedSchedule(
          any(),
          any(),
          any(),
          any(),
          any(),
          uiLocalNotificationDateInterpretation: any(
            named: 'uiLocalNotificationDateInterpretation',
          ),
          androidAllowWhileIdle: any(
            named: 'androidAllowWhileIdle',
          ),
          matchDateTimeComponents: any(
            named: 'matchDateTimeComponents',
          ),
        ),
      ).thenAnswer(
        (_) => Future.value(),
      );

      final result = await datasource.startDailyScheduleNotification(
        notificationEntity: mockNotificationEntity,
      );

      expect(result, 1);
      verify(
        () => flutterLocalNotificationsPlugin.zonedSchedule(
          any(),
          any(),
          any(),
          any(),
          any(),
          uiLocalNotificationDateInterpretation: any(
            named: 'uiLocalNotificationDateInterpretation',
          ),
          androidAllowWhileIdle: any(
            named: 'androidAllowWhileIdle',
          ),
          matchDateTimeComponents: any(
            named: 'matchDateTimeComponents',
          ),
        ),
      ).called(1);
    });

    test(
      'should throws a StartScheduleNotificationException when error occurs on flutter local notifications plugin',
      () {
        when(
          () => flutterLocalNotificationsPlugin.zonedSchedule(
            any(),
            any(),
            any(),
            any(),
            any(),
            uiLocalNotificationDateInterpretation: any(
              named: 'uiLocalNotificationDateInterpretation',
            ),
            androidAllowWhileIdle: any(
              named: 'androidAllowWhileIdle',
            ),
            matchDateTimeComponents: any(
              named: 'matchDateTimeComponents',
            ),
          ),
        ).thenThrow(Exception());

        final result = datasource.startDailyScheduleNotification(
          notificationEntity: mockNotificationEntity,
        );

        expect(() => result, throwsA(StartScheduleNotificationException()));
      },
    );
  });
}
