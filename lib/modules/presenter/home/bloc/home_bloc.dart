import 'package:agua_coach_app/core/usecase/usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/get_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SetSubscriptionNotificationUsecase setSubscriptionNotificationUsecase;
  final GetSubscriptionNotificationUsecase getSubscriptionNotificationUsecase;

  HomeBloc({
    required this.setSubscriptionNotificationUsecase,
    required this.getSubscriptionNotificationUsecase,
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
    final result = await setSubscriptionNotificationUsecase(
      SetSubscriptionNotificationParams(subscribe: event.value),
    );
    result.fold(
      (left) {
        emit(state.copyWith(showLoading: false, failure: left));
      },
      (right) {
        emit(state.copyWith(showLoading: false, isSubscribe: event.value));
      },
    );
  }
}
