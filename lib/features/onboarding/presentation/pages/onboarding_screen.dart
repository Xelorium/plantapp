import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  int _onboardingPageIndex = 0;

  List<Widget> get _onboardingPages => [
    // Sayfa 1: Identify
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 14.h, right: 20.w),
              child: AutoSizeText.rich(
                textScaleFactor: 1,
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: -1,
                ),
                minFontSize: 8,
                overflow: TextOverflow.ellipsis,
                const TextSpan(
                  text: 'Take a photo to ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: 'identify',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              top: 40.h,
              child: Image.asset(
                AppAssets.brushLine,
                color: Theme.of(context).colorScheme.onSurface,
                height: 35.h,
                width: 110.w,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        AutoSizeText(
          'the plant!',
          textScaleFactor: 1,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
            height: 0.5,
            letterSpacing: -1,
          ),
          minFontSize: 8,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
      ],
    ),
    // Sayfa 2: Care Guides
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 14.h, right: 20.w),
              child: AutoSizeText.rich(
                textScaleFactor: 1,
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: -1,
                ),
                minFontSize: 8,
                overflow: TextOverflow.ellipsis,
                const TextSpan(
                  text: 'Get plant ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: 'care guides',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              top: 40.h,
              child: Image.asset(
                AppAssets.brushLine,
                color: Theme.of(context).colorScheme.onSurface,
                height: 35.h,
                width: 150.w,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ],
    ),
  ];

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
      OnboardingBodyContent(
        pageController: _pageController,
        onPageChanged: (index) => setState(() => _onboardingPageIndex = index),
        pages: _onboardingPages,
      ),
      _onboardingPageIndex == 0 ? AppAssets.onboardingBackground1 : AppAssets.onboardingBackground2,
      AppStrings.continueText,
      _handleOnboardingButtonPress,
      OnboardingFooterContent(
        currentIndex: _onboardingPageIndex,
        pageCount: _onboardingPages.length + 1,
      ),
    ),
  ];

  void _handleOnboardingButtonPress() {
    if (_onboardingPageIndex == _onboardingPages.length - 1) {
      _goToNextPage();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
