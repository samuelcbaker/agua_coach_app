import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/entities/notification_entity.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/modules/domain/repositories/schedule_notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class StartScheduleNotificationUsecase extends Usecase<int, StartScheduleNotificationParams> {
  final IScheduleNotificationRepository scheduleNotificationRepository;
  final INotificationRepository notificationRepository;

  StartScheduleNotificationUsecase({
    required this.scheduleNotificationRepository,
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, int>> call(StartScheduleNotificationParams params) async {
    final int id;

    final resultGenerateId = await notificationRepository.generateNotificationId();

    if (resultGenerateId.isRight()) {
      id = resultGenerateId.getOrElse(() => 0);
    } else {
      return Left(resultGenerateId.swap().getOrElse(() => GenerateIdFailure()));
    }

    final notificationEntity = NotificationEntity(
      id: id,
      title: params.title,
      body: params.body,
      scheduledDateTime: params.scheduledDateTime,
    );
    return scheduleNotificationRepository.startDailyScheduleNotification(
      notificationEntity: notificationEntity,
    );
  }
}

class StartScheduleNotificationParams extends Equatable {
  final String title;
  final String body;
  final DateTime scheduledDateTime;

  const StartScheduleNotificationParams({
    required this.title,
    required this.body,
    required this.scheduledDateTime,
  });

  @override
  List<Object?> get props => [
        title,
        body,
        scheduledDateTime,
      ];
}
