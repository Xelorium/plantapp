import 'package:injectable/injectable.dart';
import 'package:plantapp/core/error/exceptions.dart';
import 'package:plantapp/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _onboardingCompleteKey = 'onboarding_complete';

  @override
  bool isOnboardingComplete() {
    return _sharedPreferences.getBool(_onboardingCompleteKey) ?? false;
  }

  @override
  Future<void> setOnboardingComplete() async {
    try {
      await _sharedPreferences.setBool(_onboardingCompleteKey, true);
    } catch (e) {
      throw CacheException(message: 'Onboarding durumu kaydedilemedi: $e');
    }
  }
}
