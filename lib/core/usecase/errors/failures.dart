import 'package:equatable/equatable.dart';

abstract class Failure {}

class SaveOnDbFailure extends Equatable implements Failure {
  @override
  List<Object?> get props => [];
}

class GetOnDbFailure extends Equatable implements Failure {
  @override
  List<Object?> get props => [];
}

class GenerateIdFailure extends Equatable implements Failure {
  @override
  List<Object?> get props => [];
}

class StartScheduleNotificationFailure extends Equatable implements Failure {
  @override
  List<Object?> get props => [];
}

class LocalNotificationPermissionRejected extends Equatable implements Failure {
  @override
  List<Object?> get props => [];
}
