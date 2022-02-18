import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class GetSubscriptionNotificationUsecase extends Usecase<bool, NoParams> {
  final INotificationRepository notificationRepository;

  GetSubscriptionNotificationUsecase({required this.notificationRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return notificationRepository.getSubscriptionNotification();
  }
}
