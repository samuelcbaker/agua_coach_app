import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class SetSubscriptionNotificationUsecase extends Usecase<void, SetSubscriptionNotificationParams> {
  final INotificationRepository notificationRepository;

  SetSubscriptionNotificationUsecase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(SetSubscriptionNotificationParams params) async {
    return notificationRepository.setSubscriptionNotification(params.subscribe);
  }
}

class SetSubscriptionNotificationParams {
  final bool subscribe;

  SetSubscriptionNotificationParams({required this.subscribe});
}
