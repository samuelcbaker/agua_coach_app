import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/repositories/schedule_notification_repository.dart';
import 'package:dartz/dartz.dart';

class StartScheduleNotificationUsecase extends Usecase<int, StartScheduleNotificationParams> {
  final IScheduleNotificationRepository repository;

  StartScheduleNotificationUsecase({required this.repository});

  @override
  Future<Either<Failure, int>> call(StartScheduleNotificationParams params) {
    throw UnimplementedError();
  }
}

class StartScheduleNotificationParams {
  final String title;
  final String body;
  final DateTime scheduledDateTime;

  StartScheduleNotificationParams({
    required this.title,
    required this.body,
    required this.scheduledDateTime,
  });
}
