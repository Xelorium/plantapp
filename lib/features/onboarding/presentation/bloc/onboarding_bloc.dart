import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/features/onboarding/domain/usecases/set_onboarding_complete_usecase.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';
part 'onboarding_bloc.freezed.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this._setOnboardingCompleteUseCase) : super(OnboardingState.initial()) {
    on<_GoToNextPage>(_onGoToNextPage);
    on<_GoToPage>(_onGoToPage);
    on<_OnboardingPageChanged>(_onOnboardingPageChanged);
    on<_SelectSubscriptionPlan>(_onSelectSubscriptionPlan);
    on<_CompleteOnboarding>(_onCompleteOnboarding);
    on<_GoToPaywall>(_onGoToPaywall);
    on<_ClosePaywall>(_onClosePaywall);
  }

  final SetOnboardingCompleteUseCase _setOnboardingCompleteUseCase;

  static const int maxOnboardingScreenIndex = 1;
  static const int maxOnboardingPageIndex = 1;

  void _onGoToNextPage(_GoToNextPage event, Emitter<OnboardingState> emit) {
    final currentScreenIndex = state.currentScreenIndex;
    final onboardingPageIndex = state.onboardingPageIndex;

    if (currentScreenIndex == 0) {
      // Move from get started to onboarding
      emit(state.copyWith(currentScreenIndex: 1));
    } else if (currentScreenIndex == 1) {
      if (onboardingPageIndex < maxOnboardingPageIndex) {
        // Move to next onboarding page
        emit(state.copyWith(onboardingPageIndex: onboardingPageIndex + 1));
      } else {
        // Move to paywall
        emit(state.copyWith(currentScreenIndex: 2));
      }
    }
  }

  void _onGoToPage(_GoToPage event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentScreenIndex: event.pageIndex));
  }

  void _onOnboardingPageChanged(_OnboardingPageChanged event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(onboardingPageIndex: event.pageIndex));
  }

  void _onSelectSubscriptionPlan(_SelectSubscriptionPlan event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(selectedSubscriptionPlanId: event.planId));
  }

  Future<void> _onCompleteOnboarding(_CompleteOnboarding event, Emitter<OnboardingState> emit) async {
    emit(state.copyWith(isLoading: true));
    
    final result = await _setOnboardingCompleteUseCase();

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (_) => emit(state.copyWith(
        isLoading: false,
        isOnboardingCompleted: true,
        error: null,
      )),
    );
  }

  void _onGoToPaywall(_GoToPaywall event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentScreenIndex: 2));
  }

  Future<void> _onClosePaywall(_ClosePaywall event, Emitter<OnboardingState> emit) async {
    // Close paywall and complete onboarding
    emit(state.copyWith(isLoading: true));
    
    final result = await _setOnboardingCompleteUseCase();

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (_) => emit(state.copyWith(
        isLoading: false,
        isOnboardingCompleted: true,
        error: null,
      )),
    );
  }
}
