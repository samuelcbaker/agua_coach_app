import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
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
  ];

  values.forEach((value) {
    registerFallbackValue(value);
  });
}
