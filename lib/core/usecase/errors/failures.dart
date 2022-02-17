import 'package:equatable/equatable.dart';

abstract class Failure {}

class SaveOnDbFailure extends Equatable implements Failure {
  @override
  List<Object?> get props => [];
}
