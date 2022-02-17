import 'package:equatable/equatable.dart';

abstract class Failure {}

class SaveOnSharedPreferencesFailure extends Equatable implements Failure {
  @override
  List<Object?> get props => [];
}
