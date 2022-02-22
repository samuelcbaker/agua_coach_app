import 'package:agua_coach_app/modules/data/datasources/schedule_notification_datasource.dart';
import 'package:agua_coach_app/modules/data/datasources/schedule_notification_datasource_impl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterNotificationPlugin extends Mock implements FlutterLocalNotificationsPlugin {}

void main() {
  late IScheduleNotificationDatasource datasource;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  setUp(() {
    flutterLocalNotificationsPlugin = MockFlutterNotificationPlugin();

    datasource = ScheduleNotificationDatasourceImpl(
      flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
    );
  });

  group('#startDailyScheduleNotification', () {
    test('should return new schedule notification id', () {
      // when(flutterLocalNotificationsPlugin.)
    });
  });
}
