import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _onboardingCompleteKey = 'onboarding_complete';

  @override
  Either<Failure, bool> isOnboardingComplete() {
    try {
      final result = _sharedPreferences.getBool(_onboardingCompleteKey) ?? false;
      return Right(result);
    } catch (e) {
      return Left(CacheFailure('${AppMessages.onboardingReadError}$e'));
    }
  }

  @override
  Future<Either<Failure, void>> setOnboardingComplete() async {
    try {
      await _sharedPreferences.setBool(_onboardingCompleteKey, true);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('${AppMessages.onboardingSaveError}$e'));
    }
  }
}
