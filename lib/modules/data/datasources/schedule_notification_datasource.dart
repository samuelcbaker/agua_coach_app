import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';

abstract class IScheduleNotificationDatasource {
  Future<int> startDailyScheduleNotification({required NotificationEntity notificationEntity});
}
