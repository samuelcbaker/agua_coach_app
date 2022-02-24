import 'package:agua_coach_app/core/common/build_config.dart';
import 'dart:async';

import 'package:agua_coach_app/di/injection_module.dart';
import 'package:agua_coach_app/di/injector.dart';
import 'package:agua_coach_app/modules/domain/usecase/get_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';

class UsecaseInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) {
    injector
      ..registerFactory(
        () => SetSubscriptionNotificationUsecase(
          notificationRepository: injector.get(),
          startScheduleNotificationUsecase: injector.get(),
          requestLocalNotificationPermission: injector.get(),
          stopAllScheduledNotificationsUsecase: injector.get(),
        ),
      )
      ..registerFactory(
        () => GetSubscriptionNotificationUsecase(
          notificationRepository: injector.get(),
        ),
      )
      ..registerFactory(
        () => StartScheduleNotificationUsecase(
          scheduleNotificationRepository: injector.get(),
          notificationRepository: injector.get(),
        ),
      );
  }
}
