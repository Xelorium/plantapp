part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.completed() = _Completed;
  const factory OnboardingState.error(String message) = _Error;
}
