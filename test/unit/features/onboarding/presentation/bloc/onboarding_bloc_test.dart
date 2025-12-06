import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import '../../../../../mocks/mock_dependencies.dart';

void main() {
  late OnboardingBloc onboardingBloc;
  late MockSetOnboardingCompleteUseCase mockSetOnboardingCompleteUseCase;

  setUp(() {
    mockSetOnboardingCompleteUseCase = MockSetOnboardingCompleteUseCase();
    onboardingBloc = OnboardingBloc(mockSetOnboardingCompleteUseCase);
  });

  tearDown(() {
    onboardingBloc.close();
  });

  group('OnboardingBloc', () {
    test('initial state should be correct', () {
      expect(onboardingBloc.state, OnboardingState.initial());
    });

    group('GoToNextPage', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'should move from get started (index 0) to onboarding (index 1)',
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const OnboardingEvent.goToNextPage()),
        expect: () => [
          OnboardingState.initial().copyWith(currentScreenIndex: 1),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'should move to next onboarding page when not at max',
        build: () => onboardingBloc,
        seed: () => OnboardingState.initial().copyWith(
          currentScreenIndex: 1,
          onboardingPageIndex: 0,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.goToNextPage()),
        expect: () => [
          OnboardingState.initial().copyWith(
            currentScreenIndex: 1,
            onboardingPageIndex: 1,
          ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'should move to paywall when at max onboarding page',
        build: () => onboardingBloc,
        seed: () => OnboardingState.initial().copyWith(
          currentScreenIndex: 1,
          onboardingPageIndex: OnboardingBloc.maxOnboardingPageIndex,
        ),
        act: (bloc) => bloc.add(const OnboardingEvent.goToNextPage()),
        expect: () => [
          OnboardingState.initial().copyWith(
            currentScreenIndex: 2,
            onboardingPageIndex: OnboardingBloc.maxOnboardingPageIndex,
          ),
        ],
      );
    });

    group('GoToPage', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'should change current screen index to specified page',
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const OnboardingEvent.goToPage(2)),
        expect: () => [
          OnboardingState.initial().copyWith(currentScreenIndex: 2),
        ],
      );
    });

    group('OnboardingPageChanged', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'should update onboarding page index',
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const OnboardingEvent.onboardingPageChanged(1)),
        expect: () => [
          OnboardingState.initial().copyWith(onboardingPageIndex: 1),
        ],
      );
    });

    group('SelectSubscriptionPlan', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'should update selected subscription plan id',
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const OnboardingEvent.selectSubscriptionPlan('premium')),
        expect: () => [
          OnboardingState.initial().copyWith(selectedSubscriptionPlanId: 'premium'),
        ],
      );
    });

    group('CompleteOnboarding', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'should complete onboarding successfully',
        build: () {
          when(() => mockSetOnboardingCompleteUseCase())
              .thenAnswer((_) async => const Right(null));
          return onboardingBloc;
        },
        act: (bloc) => bloc.add(const OnboardingEvent.completeOnboarding()),
        expect: () => [
          OnboardingState.initial().copyWith(isLoading: true),
          OnboardingState.initial().copyWith(
            isLoading: false,
            isOnboardingCompleted: true,
            error: null,
          ),
        ],
        verify: (_) {
          verify(() => mockSetOnboardingCompleteUseCase()).called(1);
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'should handle failure when completing onboarding',
        build: () {
          when(() => mockSetOnboardingCompleteUseCase())
              .thenAnswer((_) async => Left(CacheFailure('Failed to save')));
          return onboardingBloc;
        },
        act: (bloc) => bloc.add(const OnboardingEvent.completeOnboarding()),
        expect: () => [
          OnboardingState.initial().copyWith(isLoading: true),
          OnboardingState.initial().copyWith(
            isLoading: false,
            error: 'Failed to save',
          ),
        ],
        verify: (_) {
          verify(() => mockSetOnboardingCompleteUseCase()).called(1);
        },
      );
    });

    group('GoToPaywall', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'should change current screen index to paywall',
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const OnboardingEvent.goToPaywall()),
        expect: () => [
          OnboardingState.initial().copyWith(currentScreenIndex: 2),
        ],
      );
    });

    group('ClosePaywall', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'should close paywall and complete onboarding successfully',
        build: () {
          when(() => mockSetOnboardingCompleteUseCase())
              .thenAnswer((_) async => const Right(null));
          return onboardingBloc;
        },
        act: (bloc) => bloc.add(const OnboardingEvent.closePaywall()),
        expect: () => [
          OnboardingState.initial().copyWith(isLoading: true),
          OnboardingState.initial().copyWith(
            isLoading: false,
            isOnboardingCompleted: true,
            error: null,
          ),
        ],
        verify: (_) {
          verify(() => mockSetOnboardingCompleteUseCase()).called(1);
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'should handle failure when closing paywall',
        build: () {
          when(() => mockSetOnboardingCompleteUseCase())
              .thenAnswer((_) async => Left(CacheFailure('Failed to save')));
          return onboardingBloc;
        },
        act: (bloc) => bloc.add(const OnboardingEvent.closePaywall()),
        expect: () => [
          OnboardingState.initial().copyWith(isLoading: true),
          OnboardingState.initial().copyWith(
            isLoading: false,
            error: 'Failed to save',
          ),
        ],
        verify: (_) {
          verify(() => mockSetOnboardingCompleteUseCase()).called(1);
        },
      );
    });
  });
}