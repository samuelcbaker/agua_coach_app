import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/repositories/schedule_notification_repository.dart';
import 'package:dartz/dartz.dart';

class StopAllScheduledNotificationsUsecase implements Usecase<void, NoParams> {
  final IScheduleNotificationRepository repository;

  StopAllScheduledNotificationsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.stopAllScheduleNotifications();
  }
}
