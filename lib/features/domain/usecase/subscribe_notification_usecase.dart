import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/features/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class SubscribeNotificationUsecase
    extends Usecase<void, SubscribeNotificationParams> {
  final INotificationRepository notificationRepository;

  SubscribeNotificationUsecase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(SubscribeNotificationParams params) async {
    return notificationRepository.subscribeNotification(
      token: params.token,
    );
  }
}

class SubscribeNotificationParams {
  final String token;

  SubscribeNotificationParams({
    required this.token,
  });
}
