import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class INotificationRepository {
  Future<Either<Failure, void>> subscribeNotification({required String token});
}
