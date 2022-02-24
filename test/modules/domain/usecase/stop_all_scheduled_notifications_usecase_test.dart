import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/repositories/schedule_notification_repository.dart';
import 'package:agua_coach_app/modules/domain/usecase/stop_all_scheduled_notifications_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockScheduleNotificationRepository extends Mock implements IScheduleNotificationRepository {}

void main() {
  late StopAllScheduledNotificationsUsecase usecase;
  late IScheduleNotificationRepository scheduleNotificationRepository;

  setUp(() {
    scheduleNotificationRepository = MockScheduleNotificationRepository();

    usecase = StopAllScheduledNotificationsUsecase(
      repository: scheduleNotificationRepository,
    );
  });

  void mockVoidReturn() {}

  test('should stop all scheduled notifications', () async {
    when(
      () => scheduleNotificationRepository.stopAllScheduleNotifications(),
    ).thenAnswer(
      (_) async => Right(mockVoidReturn),
    );

    final result = await usecase(NoParams());

    expect(
      result,
      Right(mockVoidReturn),
    );
  });

  test('should return a StopAllScheduledNotificationFailure when an error occurs in repository', () async {
    when(
      () => scheduleNotificationRepository.stopAllScheduleNotifications(),
    ).thenAnswer(
      (_) async => Left(
        StopAllScheduledNotificationFailure(),
      ),
    );

    final result = await usecase(NoParams());

    expect(
      result,
      Left(StopAllScheduledNotificationFailure()),
    );
  });
}
