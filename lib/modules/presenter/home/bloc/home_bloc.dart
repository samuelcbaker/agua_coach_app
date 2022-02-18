import 'package:agua_coach_app/modules/domain/usecase/set_subscription_notification_usecase.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/modules/presenter/home/bloc/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SetSubscriptionNotificationUsecase setSubscriptionNotificationUsecase;

  HomeBloc({
    required this.setSubscriptionNotificationUsecase,
  }) : super(const HomeState.initial()) {
    on<HomeInitEvent>(_handleInitEvent);
    on<ChangeSubscribeNotificationEvent>(_handleChangeSubscribeNotificationEvent);
  }

  Future<void> _handleInitEvent(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(showLoading: true));
    await Future.delayed(Duration(seconds: 3));
    emit(state.copyWith(showLoading: false));
  }

  Future<void> _handleChangeSubscribeNotificationEvent(HomeEvent event, Emitter<HomeState> emit) async {}
}
