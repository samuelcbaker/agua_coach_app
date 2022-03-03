import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/modules/domain/repositories/schedule_notification_repository.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_setup.dart';

class MockScheduleNotificationRepository extends Mock implements IScheduleNotificationRepository {}

class MockNotificationRepository extends Mock implements INotificationRepository {}

void main() {
  late StartScheduleNotificationUsecase usecase;
  late IScheduleNotificationRepository scheduleNotificationRepository;
  late INotificationRepository notificationRepository;

  setUpAll(registerFallbackValues);

  setUp(() {
    scheduleNotificationRepository = MockScheduleNotificationRepository();
    notificationRepository = MockNotificationRepository();

    usecase = StartScheduleNotificationUsecase(
      scheduleNotificationRepository: scheduleNotificationRepository,
      notificationRepository: notificationRepository,
    );
  });

  final mockStartScheduleNotificationParams = StartScheduleNotificationParams(
    title: 'agua',
    body: 'beba agua',
    scheduledDateTime: DateTime(2022, 1, 1, 10),
  );

  test('should return id of created schedule notification', () async {
    when(
      () => notificationRepository.generateNotificationId(),
    ).thenAnswer(
      (_) async => const Right(1),
    );

    when(() => scheduleNotificationRepository.startDailyScheduleNotification(
          notificationEntity: any(named: 'notificationEntity'),
        )).thenAnswer(
      (_) async => const Right(1),
    );

    final result = await usecase(mockStartScheduleNotificationParams);

    expect(result, const Right<Failure, int>(1));
  });

  test('shoudld return a GenerateIdFailure when occurs an error on generate id', () async {
    when(
      () => notificationRepository.generateNotificationId(),
    ).thenAnswer(
      (_) async => Left(GenerateIdFailure()),
    );

    final result = await usecase(mockStartScheduleNotificationParams);

    expect(result, Left(GenerateIdFailure()));
  });

  test('shoudld return a StartScheduleNotificationFailure when occurs an error on schedule notification repository',
      () async {
    when(
      () => notificationRepository.generateNotificationId(),
    ).thenAnswer(
      (_) async => const Right(1),
    );

    when(() => scheduleNotificationRepository.startDailyScheduleNotification(
          notificationEntity: any(named: 'notificationEntity'),
        )).thenAnswer(
      (_) async => Left(StartScheduleNotificationFailure()),
    );

    final result = await usecase(mockStartScheduleNotificationParams);

    expect(result, Left(StartScheduleNotificationFailure()));
  });
}
