import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SetSubscriptionNotificationUsecase extends Usecase<void, SetSubscriptionNotificationParams> {
  final INotificationRepository notificationRepository;

  SetSubscriptionNotificationUsecase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(SetSubscriptionNotificationParams params) async {
    return notificationRepository.setSubscriptionNotification(subscribe: params.subscribe);
  }
}

class SetSubscriptionNotificationParams extends Equatable {
  final bool subscribe;

  const SetSubscriptionNotificationParams({
    required this.subscribe,
  });

  @override
  List<Object?> get props => [subscribe];
}
