import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class SubscribeNotificationUsecase extends Usecase<void, NoParams> {
  final INotificationRepository notificationRepository;

  SubscribeNotificationUsecase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return notificationRepository.subscribeNotification();
  }
}
