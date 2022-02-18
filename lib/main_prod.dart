import 'package:agua_coach_app/app.dart';
import 'package:agua_coach_app/di/app_component.dart';
import 'package:agua_coach_app/env/production_build_config.dart';
import 'package:agua_coach_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sl = GetIt.instance;

  final buildConfig = ProductionBuildConfig();
  await AppInjectionComponent.instance.registerModules(buildConfig);

  final injectors = [
    AppInjectionContainer(),
  ];

  await Future.wait(injectors.map((injector) async => {await injector.init(sl: sl)}));

  runApp(const WaterApp());
}
