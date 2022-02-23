import 'package:agua_coach_app/di/app_component.dart';
import 'package:agua_coach_app/env/staging_build_config.dart';
import 'package:agua_coach_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'main.dart' as app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sl = GetIt.instance;

  final buildConfig = StagingBuildConfig();
  await AppInjectionComponent.instance.registerModules(buildConfig);

  final injectors = [
    AppInjectionContainer(),
  ];

  await Future.wait(injectors.map((injector) async => {await injector.init(sl: sl)}));

  return app.start();
}
