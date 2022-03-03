import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/modules/data/datasources/schedule_notification_datasource.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:agua_coach_app/utils/helpers/tz_datetime_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ScheduleNotificationDatasourceImpl extends IScheduleNotificationDatasource {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  ScheduleNotificationDatasourceImpl({required this.flutterLocalNotificationsPlugin});

  @override
  Future<int> startDailyScheduleNotification({required NotificationEntity notificationEntity}) async {
    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationEntity.id,
        notificationEntity.title,
        notificationEntity.body,
        TzDateTimeHelper.nextInstanceOf(notificationEntity.scheduledDateTime),
        NotificationDetails(
          android: AndroidNotificationDetails(
            '${notificationEntity.id}_channel_id',
            '${notificationEntity.id}_channel_name',
            channelDescription: '${notificationEntity.id}_channel_description',
            // icon: 'app_icon.png',
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );

      return notificationEntity.id;
    } catch (e) {
      throw StartScheduleNotificationException();
    }
  }

  @override
  Future<void> stopAllScheduleNotifications() {
    try {
      return flutterLocalNotificationsPlugin.cancelAll();
    } catch (e) {
      throw StopAllScheduledNotificationException();
    }
  }
}
