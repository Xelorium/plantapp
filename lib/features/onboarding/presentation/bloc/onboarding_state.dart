part of 'onboarding_bloc.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(0) int currentScreenIndex,
    @Default(0) int onboardingPageIndex,
    @Default('yearly') String selectedSubscriptionPlanId,
    @Default(false) bool isOnboardingCompleted,
    @Default(false) bool isLoading,
    String? error,
  }) = _OnboardingState;

  factory OnboardingState.initial() => const OnboardingState();
}

enum OnboardingScreen {
  getStarted,
  onboarding,
  paywall,
}
