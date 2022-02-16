import 'package:agua_coach_app/features/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/features/domain/usecase/subscribe_notification_usecase.dart';
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

  test('should subscribe notification', () {
    // expect(actual, matcher)
  });
}
