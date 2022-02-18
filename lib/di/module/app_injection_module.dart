import 'dart:async';

import 'package:agua_coach_app/core/common/build_config.dart';
import 'package:agua_coach_app/di/injection_module.dart';
import 'package:agua_coach_app/di/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    injector.registerSingleton<BuildConfig>(buildConfig);
    final sharedPref = await SharedPreferences.getInstance();
    injector.registerFactory<SharedPreferences>(() => sharedPref);
  }
}
