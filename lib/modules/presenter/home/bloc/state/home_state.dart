import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    @Default(false) bool showLoading,
    @Default(false) bool isSubscribe,
    Failure? failure,
  }) = Initial;
}
