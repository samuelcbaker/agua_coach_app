import 'package:agua_coach_app/modules/data/datasources/schedule_notification_datasource.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ScheduleNotificationDatasourceImpl extends IScheduleNotificationDatasource {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  ScheduleNotificationDatasourceImpl({required this.flutterLocalNotificationsPlugin});

  @override
  Future<int> startDailyScheduleNotification({required NotificationEntity notificationEntity}) {
    // TODO: implement startDailyScheduleNotification
    throw UnimplementedError();
  }
}
