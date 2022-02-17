import 'dart:async';

import 'package:agua_coach_app/core/common/build_config.dart';
import 'package:agua_coach_app/di/app_injector.dart';
import 'package:agua_coach_app/di/module/app_modules.dart';

abstract class InjectionComponent {
  FutureOr<void> registerModules(BuildConfig config);
}

class AppInjectionComponent implements InjectionComponent {
  AppInjectionComponent._();

  static AppInjectionComponent instance = AppInjectionComponent._();

  @override
  FutureOr<void> registerModules(BuildConfig config) async {
    for (final module in appInjectionModules) {
      await module.registerDependencies(
        injector: AppInjector.I,
        buildConfig: config,
      );
    }
  }
}
