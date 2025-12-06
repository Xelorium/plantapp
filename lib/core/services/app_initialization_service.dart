import 'package:injectable/injectable.dart';
import 'package:plantapp/features/onboarding/domain/usecases/is_onboarding_complete_usecase.dart';

@singleton
class AppInitializationService {

  AppInitializationService(this._isOnboardingCompleteUseCase);
  final IsOnboardingCompleteUseCase _isOnboardingCompleteUseCase;

  bool get isOnboardingComplete {
    final result = _isOnboardingCompleteUseCase();
    return result.fold(
      (failure) => false,
      (isComplete) => isComplete,
    );
  }
}
