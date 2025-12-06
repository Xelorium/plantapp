import 'package:fpdart/fpdart.dart';
import 'package:plantapp/core/error/failures.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, void>> setOnboardingComplete();
  Either<Failure, bool> isOnboardingComplete();
}
