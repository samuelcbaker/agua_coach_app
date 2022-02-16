import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/features/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/features/domain/usecase/subscribe_notification_usecase.dart';
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

  final subscribeNotificationParamsMock = SubscribeNotificationParams(
    token: 'token',
  );

  test('should subscribe notification', () {
    when(() => notificationRepository.subscribeNotification(token: any()))
        .thenAnswer((_) async => Right<Failure, void>(null));

    expect(
      () => usecase(subscribeNotificationParamsMock),
      Right<Failure, void>(null),
    );
  });
}
