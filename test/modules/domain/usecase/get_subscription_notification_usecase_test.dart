import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/modules/domain/usecase/get_subscription_notification_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationRepository extends Mock implements INotificationRepository {}

void main() {
  late GetSubscriptionNotificationUsecase usecase;
  late INotificationRepository notificationRepository;

  setUp(() {
    notificationRepository = MockNotificationRepository();
    usecase = GetSubscriptionNotificationUsecase(notificationRepository: notificationRepository);
  });

  test(
    'should get subscribe notification',
    () async {
      when(() => notificationRepository.getSubscriptionNotification()).thenAnswer((_) async => Right(false));

      final result = await usecase(NoParams());

      expect(
        result,
        Right<Failure, bool>(false),
      );

      verify(
        () => notificationRepository.getSubscriptionNotification(),
      ).called(1);
    },
  );

  test(
    'should return GetOnDbFailure if repository error',
    () async {
      when(() => notificationRepository.getSubscriptionNotification()).thenAnswer((_) async => Left(GetOnDbFailure()));

      final result = await usecase(NoParams());

      expect(
        result,
        Left<Failure, void>(GetOnDbFailure()),
      );
      verify(
        () => notificationRepository.getSubscriptionNotification(),
      ).called(1);
    },
  );
}
