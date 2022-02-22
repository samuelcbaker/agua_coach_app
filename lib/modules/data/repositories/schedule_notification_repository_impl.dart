import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/modules/data/datasources/schedule_notification_datasource.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/modules/domain/repositories/schedule_notification_repository.dart';
import 'package:dartz/dartz.dart';

class ScheduleNotificationRepositoryImpl extends IScheduleNotificationRepository {
  final IScheduleNotificationDatasource datasource;

  ScheduleNotificationRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, int>> startDailyScheduleNotification({required NotificationEntity notificationEntity}) async {
    try {
      final result = await datasource.startDailyScheduleNotification(
        notificationEntity: notificationEntity,
      );
      return Right(result);
    } on StartScheduleNotificationException {
      return Left(StartScheduleNotificationFailure());
    }
  }

  @override
  Future<Either<Failure, void>> stopAllScheduleNotifications() {
    // TODO: implement stopAllScheduleNotifications
    throw UnimplementedError();
  }
}
