import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/features/notification/domain/usecase/subscribe_notification_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNotificationRepository extends Mock
    implements INotificationRepository {}

void main() {
  late SubscribeNotificationUsecase usecase;
  late INotificationRepository notificationRepository;

  setUp(() {
    notificationRepository = MockNotificationRepository();
    usecase = SubscribeNotificationUsecase(
        notificationRepository: notificationRepository);
  });

  test(
    'should subscribe notification',
    () async {
      when(() => notificationRepository.subscribeNotification())
          .thenAnswer((_) async => const Right(null));

      await usecase(NoParams());

      verify(
        () => notificationRepository.subscribeNotification(),
      ).called(1);
    },
  );

  final subscribeFailure = SubscribeNotificationFailure();

  test(
    'should return SubscribeNotificationFailure if repository error',
    () async {
      when(() => notificationRepository.subscribeNotification())
          .thenAnswer((_) async => Left<Failure, void>(subscribeFailure));

      final result = await usecase(NoParams());

      expect(
        result,
        Left<Failure, void>(subscribeFailure),
      );
      verify(
        () => notificationRepository.subscribeNotification(),
      ).called(1);
    },
  );
}
