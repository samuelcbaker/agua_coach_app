import 'package:agua_coach_app/features/presenter/home/bloc/event/home_event.dart';
import 'package:agua_coach_app/features/presenter/home/bloc/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial());
}
