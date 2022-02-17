import 'package:agua_coach_app/core/usecase/errors/exceptions.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/features/data/datasources/notification_datasource.dart';
import 'package:agua_coach_app/features/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class NotificationRepositoryImpl implements INotificationRepository {
  final INotificationDatasource datasource;

  NotificationRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> setSubscriptionNotification({required bool subscribe}) async {
    try {
      final result = await datasource.setSubscriptionNotification(subscribe: subscribe);
      return Right(result);
    } on SaveOnDbException {
      return Left(SaveOnDbFailure());
    }
  }
}