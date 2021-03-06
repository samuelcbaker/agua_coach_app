import 'package:agua_coach_app/core/common/build_config.dart';
import 'dart:async';

import 'package:agua_coach_app/di/injection_module.dart';
import 'package:agua_coach_app/di/injector.dart';
import 'package:agua_coach_app/modules/data/repositories/notification_repository_impl.dart';
import 'package:agua_coach_app/modules/data/repositories/schedule_notification_repository_impl.dart';
import 'package:agua_coach_app/modules/domain/repositories/notification_repository.dart';
import 'package:agua_coach_app/modules/domain/repositories/schedule_notification_repository.dart';

class RepositoryInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) {
    injector
      ..registerFactory<INotificationRepository>(
        () => NotificationRepositoryImpl(
          datasource: injector.get(),
        ),
      )
      ..registerFactory<IScheduleNotificationRepository>(
        () => ScheduleNotificationRepositoryImpl(
          datasource: injector.get(),
        ),
      );
  }
}
