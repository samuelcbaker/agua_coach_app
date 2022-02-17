import 'package:agua_coach_app/di/injection_module.dart';
import 'package:agua_coach_app/di/module/app_injection_module.dart';
import 'package:agua_coach_app/di/module/datasource_injection_module.dart';
import 'package:agua_coach_app/di/module/repository_injection_module.dart';
import 'package:agua_coach_app/di/module/usecase_injection_module.dart';

final List<InjectionModule> appInjectionModules = <InjectionModule>[
  AppInjectionModule(),
  DatasourceInjectionModule(),
  RepositoryInjectionModule(),
  UsecaseInjectionModule(),
];
