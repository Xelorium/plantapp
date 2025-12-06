part of 'onboarding_bloc.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.goToNextPage() = _GoToNextPage;
  const factory OnboardingEvent.goToPage(int pageIndex) = _GoToPage;
  const factory OnboardingEvent.onboardingPageChanged(int pageIndex) = _OnboardingPageChanged;
  const factory OnboardingEvent.selectSubscriptionPlan(String planId) = _SelectSubscriptionPlan;
  const factory OnboardingEvent.completeOnboarding() = _CompleteOnboarding;
  const factory OnboardingEvent.goToPaywall() = _GoToPaywall;
  const factory OnboardingEvent.closePaywall() = _ClosePaywall;
}
