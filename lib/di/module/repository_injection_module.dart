import 'package:agua_coach_app/core/common/build_config.dart';
import 'dart:async';

import 'package:agua_coach_app/di/injection_module.dart';
import 'package:agua_coach_app/di/injector.dart';
import 'package:agua_coach_app/features/data/repositories/notification_repository_impl.dart';
import 'package:agua_coach_app/features/domain/repositories/notification_repository.dart';

class RepositoryInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) {
    injector.registerFactory<INotificationRepository>(() => NotificationRepositoryImpl(datasource: injector.get()));
  }
}
