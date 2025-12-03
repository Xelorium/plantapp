import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/onboarding/domain/repositories/onboarding_repository.dart';

@injectable
class SetOnboardingCompleteUseCase {
  SetOnboardingCompleteUseCase(this._repository);

  final OnboardingRepository _repository;

  Future<Either<Failure, void>> call() async {
    return await _repository.setOnboardingComplete();
  }
}
