import 'package:agua_coach_app/core/permissions/request_local_notification_permission.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_setup.dart';

class MockNotificationRepository extends Mock implements INotificationRepository {}

class MockStartScheduleNotificationUsecase extends Mock implements StartScheduleNotificationUsecase {}

class MockRequestLocalNotificationPermission extends Mock implements RequestLocalNotificationPermission {}

void main() {
  late SetSubscriptionNotificationUsecase usecase;
  late INotificationRepository notificationRepository;
  late StartScheduleNotificationUsecase startScheduleNotificationUsecase;
  late RequestLocalNotificationPermission requestLocalNotificationPermission;

  setUpAll(registerFallbackValues);

  setUp(() {
    notificationRepository = MockNotificationRepository();
    startScheduleNotificationUsecase = MockStartScheduleNotificationUsecase();
    requestLocalNotificationPermission = MockRequestLocalNotificationPermission();

    usecase = SetSubscriptionNotificationUsecase(
      notificationRepository: notificationRepository,
      startScheduleNotificationUsecase: startScheduleNotificationUsecase,
      requestLocalNotificationPermission: requestLocalNotificationPermission,
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

    final result = await usecase(mockSetSubscriptionNotificationParams);

    expect(
      result,
      Left(StartScheduleNotificationFailure()),
    );
    verifyNever(
      () => notificationRepository.setSubscriptionNotification(subscribe: true),
    );
  });
}
