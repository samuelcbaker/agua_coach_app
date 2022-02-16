import 'package:agua_coach_app/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<Output, Params> {
  Future<Either<Failure, Output>> call(Params params);
}

class NoParams {}
