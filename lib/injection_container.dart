import 'package:agua_coach_app/di/app_injector.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class InjectionContainer {
  Future<void> init({required GetIt sl});
}

final sl = AppInjector.I.get;

class AppInjectionContainer implements InjectionContainer {
  @override
  Future<void> init({required GetIt sl}) async {
    sl.registerFactory(
      () => HomeBloc(
        setSubscriptionNotificationUsecase: sl(),
        getSubscriptionNotificationUsecase: sl(),
        startScheduleNotificationUsecase: sl(),
        requestLocalNotificationPermission: sl(),
      ),
    );
  }
}
