import 'package:agua_coach_app/core/common/build_config.dart';
import 'dart:async';

import 'package:agua_coach_app/di/injection_module.dart';
import 'package:agua_coach_app/di/injector.dart';
import 'package:agua_coach_app/features/domain/usecase/set_subscription_notification_usecase.dart';

class UsecaseInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) {
    injector.registerFactory(() => SetSubscriptionNotificationUsecase(notificationRepository: injector.get()));
  }
}
