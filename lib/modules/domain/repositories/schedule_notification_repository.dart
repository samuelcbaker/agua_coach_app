import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IScheduleNotificationRepository {
  Future<Either<Failure, int>> startDailyScheduleNotification({
    required NotificationEntity notificationEntity,
  });

  Future<Either<Failure, void>> stopAllScheduleNotifications();
}
