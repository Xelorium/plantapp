import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/get_started_components.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/onboarding_components.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/onboarding_wrapper.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  void _goToNextPage() {
    if (_currentIndex >= _onboardingComponents.length - 1) return;

    setState(() => _currentIndex++);
  }

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<(Widget bodyContent, String backgroundImagePath, String buttonText, VoidCallback onButtonPressed, Widget footerContent)> get _onboardingComponents => [
    (
      const GetStartedBodyContent(),
      AppAssets.getStartedBackground,
      AppStrings.getStarted,
      _goToNextPage,
      GetStartedFooterContent(
        onPrivacyTap: () {},
        onTermsTap: () {},
      ),
    ),
    (
      OnboardingBodyContent(pageController: _pageController),
      AppAssets.onboardingBackground1,
      AppStrings.continueText,
      () {},
      const OnboardingFooterContent(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardingCubit>(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return OnboardingWrapper(
              bodyContent: _onboardingComponents[_currentIndex].$1,
              backgroundImagePath: _onboardingComponents[_currentIndex].$2,
              buttonText: _onboardingComponents[_currentIndex].$3,
              onButtonPressed: _onboardingComponents[_currentIndex].$4,
              footerContent: _onboardingComponents[_currentIndex].$5,
            );
          },
        ),
      ),
    );
  }
}
