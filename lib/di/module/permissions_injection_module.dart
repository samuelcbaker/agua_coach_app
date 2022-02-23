import 'package:agua_coach_app/core/common/build_config.dart';
import 'package:agua_coach_app/core/permissions/request_local_notification_permission.dart';
import 'dart:async';

import 'package:agua_coach_app/di/injection_module.dart';
import 'package:agua_coach_app/di/injector.dart';

class PermissionsInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) {
    injector.registerSingleton(
      RequestLocalNotificationPermission(
        flutterLocalNotificationsPlugin: injector.get(),
      ),
    );
  }
}
