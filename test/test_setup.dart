import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timezone/timezone.dart' as tz;

void registerFallbackValues() {
  final values = [
    NotificationEntity(
      id: 1,
      title: '',
      body: '',
      scheduledDateTime: DateTime(2022),
    ),
    tz.TZDateTime(
      tz.Location(
        'America/Sao_Paulo',
        [],
        [],
        [],
      ),
      2022,
      1,
      1,
      9,
      0,
    ),
    const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName'),
    ),
    UILocalNotificationDateInterpretation.absoluteTime,
    DateTimeComponents.time,
    StartScheduleNotificationParams(
      title: '',
      body: '',
      scheduledDateTime: DateTime(2022, 1, 1, 10),
    ),
    NoParams(),
  ];

  values.forEach((value) {
    registerFallbackValue(value);
  });
}
