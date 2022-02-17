import 'dart:async';

import 'package:agua_coach_app/core/common/build_config.dart';
import 'package:agua_coach_app/di/injector.dart';

abstract class InjectionModule {
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  });
}
