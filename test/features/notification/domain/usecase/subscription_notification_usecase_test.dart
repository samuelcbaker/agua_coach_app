import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/features/notification/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationRepository extends Mock implements INotificationRepository {}

void main() {
  late SetSubscriptionNotificationUsecase usecase;
  late INotificationRepository notificationRepository;

  setUp(() {
    notificationRepository = MockNotificationRepository();
    usecase = SetSubscriptionNotificationUsecase(notificationRepository: notificationRepository);
  });

  final mockSetSubscriptionNotificationParams = SetSubscriptionNotificationParams(
    subscribe: true,
  );

  void mockVoidReturn() {
    return;
  }

  final subscribeFailure = SaveOnDbFailure();

  test(
    'should subscribe notification',
    () async {
      when(() => notificationRepository.setSubscriptionNotification(subscribe: true))
          .thenAnswer((_) async => Right(mockVoidReturn));

      final result = await usecase(mockSetSubscriptionNotificationParams);

      expect(
        result,
        Right<Failure, void>(mockVoidReturn),
      );

      verify(
        () => notificationRepository.setSubscriptionNotification(subscribe: true),
      ).called(1);
    },
  );

  test(
    'should return SetSubscriptionNotificationFailure if repository error',
    () async {
      when(() => notificationRepository.setSubscriptionNotification(subscribe: true))
          .thenAnswer((_) async => Left(subscribeFailure));

      final result = await usecase(mockSetSubscriptionNotificationParams);

      expect(
        result,
        Left<Failure, void>(subscribeFailure),
      );
      verify(
        () => notificationRepository.setSubscriptionNotification(subscribe: true),
      ).called(1);
    },
  );
}
