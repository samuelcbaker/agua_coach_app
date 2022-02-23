import 'package:agua_coach_app/core/permissions/request_local_notification_permission.dart';
import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/get_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/start_schedule_notification_usecase.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SetSubscriptionNotificationUsecase setSubscriptionNotificationUsecase;
  final GetSubscriptionNotificationUsecase getSubscriptionNotificationUsecase;
  final StartScheduleNotificationUsecase startScheduleNotificationUsecase;
  final RequestLocalNotificationPermission requestLocalNotificationPermission;

  HomeBloc({
    required this.setSubscriptionNotificationUsecase,
    required this.getSubscriptionNotificationUsecase,
    required this.startScheduleNotificationUsecase,
    required this.requestLocalNotificationPermission,
  }) : super(const HomeState.initial()) {
    on<HomeInitEvent>(_handleInitEvent);
    on<ChangeSubscribeNotificationEvent>(_handleChangeSubscribeNotificationEvent);
  }

  Future<void> _handleInitEvent(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      showLoading: true,
      failure: null,
    ));
    final subscribeResult = await getSubscriptionNotificationUsecase(NoParams());
    subscribeResult.fold(
      (left) {
        emit(state.copyWith(
          showLoading: false,
          failure: left,
        ));
      },
      (right) {
        emit(state.copyWith(
          showLoading: false,
          isSubscribe: right,
          failure: null,
        ));
      },
    );
  }

  Future<void> _handleChangeSubscribeNotificationEvent(
      ChangeSubscribeNotificationEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      showLoading: true,
      failure: null,
    ));

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
          failure: null,
        ));
      },
    );
  }

  _stopJob() async {
    // await flutterLocalNotificationsPlugin.cancelAll();
  }
}
