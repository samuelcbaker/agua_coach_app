import 'package:agua_coach_app/core/common/build_config.dart';
import 'package:agua_coach_app/core/db/db_client.dart';
import 'package:agua_coach_app/core/db/shared_preferences_client.dart';
import 'dart:async';

import 'package:agua_coach_app/di/injection_module.dart';
import 'package:agua_coach_app/di/injector.dart';
import 'package:agua_coach_app/features/data/datasources/notification_datasource.dart';
import 'package:agua_coach_app/features/data/datasources/notification_datasource_impl.dart';

class DatasourceInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector, required BuildConfig buildConfig}) {
    injector
      ..registerSingleton<IDbClient>(SharedPreferencesClient(
        sharedPreferences: injector.get(),
      ))
      ..registerSingleton<INotificationDatasource>(NotificationDatasourceImpl(
        dbClient: injector.get(),
      ));
  }
}
