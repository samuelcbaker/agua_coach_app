import 'package:agua_coach_app/core/permissions/request_local_notification_permission.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SetSubscriptionNotificationUsecase extends Usecase<void, SetSubscriptionNotificationParams> {
  final INotificationRepository notificationRepository;
  final StartScheduleNotificationUsecase startScheduleNotificationUsecase;
  final RequestLocalNotificationPermission requestLocalNotificationPermission;

  SetSubscriptionNotificationUsecase({
    required this.notificationRepository,
    required this.startScheduleNotificationUsecase,
    required this.requestLocalNotificationPermission,
  });

  @override
  Future<Either<Failure, void>> call(SetSubscriptionNotificationParams params) async {
    if (params.subscribe) {
      final resultRequestLocalNotifications = await requestLocalNotificationPermission();
      if (resultRequestLocalNotifications.isRight()) {
        if (!resultRequestLocalNotifications.getOrElse(() => true)) {
          return Left(LocalNotificationPermissionRejectedFailure());
        }
      } else {
        return Left(
          resultRequestLocalNotifications.swap().getOrElse(
                () => RequestLocalNotificationPermissionFailure(),
              ),
        );
      }

      final resultScheduleNotifications = await _scheduleAllNotifications();
      if (resultScheduleNotifications.isLeft()) {
        return Left(
          resultScheduleNotifications.swap().getOrElse(
                () => StartScheduleNotificationFailure(),
              ),
        );
      }
    }

    return notificationRepository.setSubscriptionNotification(subscribe: params.subscribe);
  }

  Future<Either<Failure, int>> _scheduleAllNotifications() async {
    final now = DateTime.now();

    final resultFirstNotification = await startScheduleNotificationUsecase(StartScheduleNotificationParams(
      title: 'Já bebeu água hoje?',
      body: 'Aproveite sua manhã com o corpo super hidratado!',
      scheduledDateTime: DateTime(now.year, now.month, now.day, 10),
    ));

    if (resultFirstNotification.isLeft()) {
      return Left(
        resultFirstNotification.swap().getOrElse(
              () => StartScheduleNotificationFailure(),
            ),
      );
    }

    final resultSecondNotification = await startScheduleNotificationUsecase(StartScheduleNotificationParams(
      title: 'Já bebeu água hoje?',
      body: 'Sua tarde será melhor com sua saúde feliz!',
      scheduledDateTime: DateTime(now.year, now.month, now.day, 15),
    ));

    if (resultSecondNotification.isLeft()) {
      return Left(
        resultSecondNotification.swap().getOrElse(
              () => StartScheduleNotificationFailure(),
            ),
      );
    }

    final resultThirdNotification = await startScheduleNotificationUsecase(StartScheduleNotificationParams(
      title: 'Já bebeu água hoje?',
      body: 'De noite também é hora, aproveite!',
      scheduledDateTime: DateTime(now.year, now.month, now.day, 19),
    ));

    if (resultThirdNotification.isLeft()) {
      return Left(
        resultThirdNotification.swap().getOrElse(
              () => StartScheduleNotificationFailure(),
            ),
      );
    }

    return const Right(0);
  }
}

class SetSubscriptionNotificationParams extends Equatable {
  final bool subscribe;

  const SetSubscriptionNotificationParams({
    required this.subscribe,
  });

  @override
  List<Object?> get props => [subscribe];
}
