import 'package:agua_coach_app/app.dart';
import 'package:agua_coach_app/di/app_component.dart';
import 'package:agua_coach_app/env/staging_build_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final buildConfig = StagingBuildConfig();
  await AppInjectionComponent.instance.registerModules(buildConfig);

  runApp(const WaterApp());
}
