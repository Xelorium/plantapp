import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/onboarding/domain/repositories/onboarding_repository.dart';

@injectable
class IsOnboardingCompleteUseCase {
  IsOnboardingCompleteUseCase(this._repository);

  final OnboardingRepository _repository;

  Either<Failure, bool> call() {
    return _repository.isOnboardingComplete();
  }
}
