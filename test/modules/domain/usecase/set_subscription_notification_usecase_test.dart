import 'package:agua_coach_app/core/permissions/request_local_notification_permission.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/stop_all_scheduled_notifications_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_setup.dart';

class MockNotificationRepository extends Mock implements INotificationRepository {}

class MockStartScheduleNotificationUsecase extends Mock implements StartScheduleNotificationUsecase {}

class MockRequestLocalNotificationPermission extends Mock implements RequestLocalNotificationPermission {}

class MockStopAllScheduledNotificationsUsecase extends Mock implements StopAllScheduledNotificationsUsecase {}

void main() {
  late SetSubscriptionNotificationUsecase usecase;
  late INotificationRepository notificationRepository;
  late StartScheduleNotificationUsecase startScheduleNotificationUsecase;
  late RequestLocalNotificationPermission requestLocalNotificationPermission;
  late StopAllScheduledNotificationsUsecase stopAllScheduledNotificationsUsecase;

  setUpAll(registerFallbackValues);

  setUp(() {
    notificationRepository = MockNotificationRepository();
    startScheduleNotificationUsecase = MockStartScheduleNotificationUsecase();
    requestLocalNotificationPermission = MockRequestLocalNotificationPermission();
    stopAllScheduledNotificationsUsecase = MockStopAllScheduledNotificationsUsecase();

    usecase = SetSubscriptionNotificationUsecase(
      notificationRepository: notificationRepository,
      startScheduleNotificationUsecase: startScheduleNotificationUsecase,
      requestLocalNotificationPermission: requestLocalNotificationPermission,
      stopAllScheduledNotificationsUsecase: stopAllScheduledNotificationsUsecase,
    );
  });

  const mockSetSubscriptionNotificationParams = SetSubscriptionNotificationParams(
    subscribe: true,
  );

  void mockVoidReturn() {
    return;
  }

  final subscribeFailure = SaveOnDbFailure();

  test(
    'should subscribe notification',
    () async {
      when(
        () => requestLocalNotificationPermission(),
      ).thenAnswer(
        (_) async => const Right(true),
      );

      when(
        () => startScheduleNotificationUsecase(any()),
      ).thenAnswer(
        (_) async => const Right(1),
      );

      when(
        () => notificationRepository.setSubscriptionNotification(
          subscribe: any(
            named: 'subscribe',
          ),
        ),
      ).thenAnswer(
        (_) async => Right(mockVoidReturn),
      );

      final result = await usecase(mockSetSubscriptionNotificationParams);

      expect(
        result,
        Right(mockVoidReturn),
      );

      verify(
        () => notificationRepository.setSubscriptionNotification(subscribe: true),
      ).called(1);
    },
  );

  test(
    'should return SaveOnDbFailure if repository error',
    () async {
      when(
        () => requestLocalNotificationPermission(),
      ).thenAnswer(
        (_) async => const Right(true),
      );

      when(
        () => startScheduleNotificationUsecase(any()),
      ).thenAnswer(
        (_) async => const Right(1),
      );

      when(
        () => notificationRepository.setSubscriptionNotification(
          subscribe: any(
            named: 'subscribe',
          ),
        ),
      ).thenAnswer(
        (_) async => Left(subscribeFailure),
      );

      final result = await usecase(mockSetSubscriptionNotificationParams);

      expect(
        result,
        Left(subscribeFailure),
      );
      verify(
        () => notificationRepository.setSubscriptionNotification(subscribe: true),
      ).called(1);
    },
  );

  test(
      'should return a RequestLocalNotificationPermissionFailure when an error occurs on request permission notification',
      () async {
    when(
      () => requestLocalNotificationPermission(),
    ).thenAnswer(
      (_) async => Left(RequestLocalNotificationPermissionFailure()),
    );

    final result = await usecase(mockSetSubscriptionNotificationParams);

    expect(
      result,
      Left(RequestLocalNotificationPermissionFailure()),
    );
    verifyNever(
      () => notificationRepository.setSubscriptionNotification(subscribe: true),
    );
  });

  test('should return a LocalNotificationPermissionRejectedFailure when permission notification is false', () async {
    when(
      () => requestLocalNotificationPermission(),
    ).thenAnswer(
      (_) async => const Right(false),
    );

    final result = await usecase(mockSetSubscriptionNotificationParams);

    expect(
      result,
      Left(LocalNotificationPermissionRejectedFailure()),
    );
    verifyNever(
      () => notificationRepository.setSubscriptionNotification(subscribe: true),
    );
  });

  test('should return a StartScheduleNotificationFailure when an error occurs in schedule notification', () async {
    when(
      () => requestLocalNotificationPermission(),
    ).thenAnswer(
      (_) async => const Right(true),
    );

    when(
      () => startScheduleNotificationUsecase(any()),
    ).thenAnswer(
      (_) async => Left(StartScheduleNotificationFailure()),
    );

    when(
      () => stopAllScheduledNotificationsUsecase(any()),
    ).thenAnswer((_) async => Right(mockVoidReturn));

    final result = await usecase(mockSetSubscriptionNotificationParams);

    expect(
      result,
      Left(StartScheduleNotificationFailure()),
    );
    verify(
      () => stopAllScheduledNotificationsUsecase(any()),
    ).called(1);
    verifyNever(
      () => notificationRepository.setSubscriptionNotification(subscribe: true),
    );
  });

  test(
    'should stop subscribe notification when value is false',
    () async {
      when(
        () => notificationRepository.setSubscriptionNotification(
          subscribe: any(
            named: 'subscribe',
          ),
        ),
      ).thenAnswer(
        (_) async => Right(mockVoidReturn),
      );

      when(
        () => stopAllScheduledNotificationsUsecase(any()),
      ).thenAnswer(
        (invocation) async => Right(mockVoidReturn),
      );

      final result = await usecase(
        const SetSubscriptionNotificationParams(subscribe: false),
      );

      expect(
        result,
        Right(mockVoidReturn),
      );

      verify(
        () => notificationRepository.setSubscriptionNotification(subscribe: any(named: 'subscribe')),
      ).called(1);

      verify(
        () => stopAllScheduledNotificationsUsecase(any()),
      ).called(1);

      verifyNever(() => requestLocalNotificationPermission());
      verifyNever(() => startScheduleNotificationUsecase(any()));
    },
  );

  test('should return StopAllScheduledNotificationFailure when an error occurs in stop notifications', () async {
    when(
      () => stopAllScheduledNotificationsUsecase(any()),
    ).thenAnswer(
      (invocation) async => Left(StopAllScheduledNotificationFailure()),
    );

    final result = await usecase(
      const SetSubscriptionNotificationParams(subscribe: false),
    );

    expect(
      result,
      Left(StopAllScheduledNotificationFailure()),
    );

    verifyNever(
      () => notificationRepository.setSubscriptionNotification(
        subscribe: any(named: 'subscribe'),
      ),
    );
  });
}
