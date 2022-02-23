import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/get_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/state/home_state.dart';
import 'package:agua_coach_app/utils/permissions/request_local_notification_permission.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SetSubscriptionNotificationUsecase setSubscriptionNotificationUsecase;
  final GetSubscriptionNotificationUsecase getSubscriptionNotificationUsecase;
  final StartScheduleNotificationUsecase startScheduleNotificationUsecase;

  HomeBloc({
    required this.setSubscriptionNotificationUsecase,
    required this.getSubscriptionNotificationUsecase,
    required this.startScheduleNotificationUsecase,
  }) : super(const HomeState.initial()) {
    on<HomeInitEvent>(_handleInitEvent);
    on<ChangeSubscribeNotificationEvent>(_handleChangeSubscribeNotificationEvent);
  }

  Future<void> _handleInitEvent(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(showLoading: true));
    final subscribeResult = await getSubscriptionNotificationUsecase(NoParams());
    subscribeResult.fold(
      (left) {
        emit(state.copyWith(showLoading: false, failure: left));
      },
      (right) {
        emit(state.copyWith(showLoading: false, isSubscribe: right));
      },
    );
  }

  Future<void> _handleChangeSubscribeNotificationEvent(
      ChangeSubscribeNotificationEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(showLoading: true));

    if (event.value && !(await requestLocalNotificationPermission())) {
      emit(state.copyWith(
        failure: LocalNotificationPermissionRejected(),
        showLoading: false,
      ));
      return;
    }

    final result = await setSubscriptionNotificationUsecase(
      SetSubscriptionNotificationParams(subscribe: event.value),
    );
    result.fold(
      (left) {
        emit(state.copyWith(
          showLoading: false,
          failure: left,
        ));
      },
      (right) {
        emit(state.copyWith(
          showLoading: false,
          isSubscribe: event.value,
        ));

        event.value ? _startJob() : _stopJob();
      },
    );
  }

  _stopJob() async {
    // await flutterLocalNotificationsPlugin.cancelAll();
  }

  _startJob() async {
    final now = DateTime.now();

    await startScheduleNotificationUsecase(StartScheduleNotificationParams(
      title: 'Já bebeu água hoje?',
      body: 'Aproveite sua manhã com o corpo super hidratado!',
      scheduledDateTime: DateTime(now.year, now.month, now.day, 10),
    ));

    await startScheduleNotificationUsecase(StartScheduleNotificationParams(
      title: 'Já bebeu água hoje?',
      body: 'Sua tarde será melhor com sua saúde feliz!',
      scheduledDateTime: DateTime(now.year, now.month, now.day, 15),
    ));

    await startScheduleNotificationUsecase(StartScheduleNotificationParams(
      title: 'Já bebeu água hoje?',
      body: 'De noite também é hora, aproveite!',
      scheduledDateTime: DateTime(now.year, now.month, now.day, 19),
    ));
  }
}
