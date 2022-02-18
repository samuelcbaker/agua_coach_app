import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class INotificationRepository {
  Future<Either<Failure, void>> setSubscriptionNotification({required bool subscribe});
  Future<Either<Failure, bool>> getSubscriptionNotification();
}
