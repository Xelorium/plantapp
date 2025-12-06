import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/navigation/app_router.gr.dart';
import 'package:plantapp/core/theme/app_text_styles.dart';
import 'package:plantapp/features/onboarding/presentation/bloc/onboarding_bloc.dart';
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
  void _goToNextPage() {
    context.read<OnboardingBloc>().add(const OnboardingEvent.goToNextPage());
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

  List<Widget> get _onboardingPages => [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 14.h, right: 20.w), // Keeping responsive specific padding as is or matching closest Spacings if applicable. Let's keep specific where critical layout.
              child: AutoSizeText.rich(
                textScaleFactor: 1,
                style: AppTextStyles.h1(context).copyWith(
                  fontSize: 28.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: -1,
                ),
                minFontSize: 8,
                overflow: TextOverflow.ellipsis,
                const TextSpan(
                  text: AppStrings.takePhotoTo,
                  style: TextStyle(fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: AppStrings.identify,
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
          AppStrings.thePlant,
          textScaleFactor: 1,
          style: AppTextStyles.h1(context).copyWith(
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
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 14.h, right: 20.w),
              child: AutoSizeText.rich(
                textScaleFactor: 1,
                style: AppTextStyles.h1(context).copyWith(
                  fontSize: 28.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: -1,
                ),
                minFontSize: 8,
                overflow: TextOverflow.ellipsis,
                const TextSpan(
                  text: AppStrings.getPlant,
                  style: TextStyle(fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: AppStrings.careGuides,
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

  List<(Widget bodyContent, String backgroundImagePath, String buttonText, VoidCallback onButtonPressed, Widget footerContent)> _buildOnboardingComponents(
    int onboardingPageIndex,
  ) => [
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
        onPageChanged: (index) => context.read<OnboardingBloc>().add(OnboardingEvent.onboardingPageChanged(index)),
        pages: _onboardingPages,
      ),
      onboardingPageIndex == 0 ? AppAssets.onboardingBackground1 : AppAssets.onboardingBackground2,
      AppStrings.continueText,
      () => _handleOnboardingButtonPress(onboardingPageIndex),
      OnboardingFooterContent(
        currentIndex: onboardingPageIndex,
        pageCount: _onboardingPages.length + 1,
      ),
    ),
  ];

  void _handleOnboardingButtonPress(int currentPageIndex) {
    if (currentPageIndex == _onboardingPages.length - 1) {
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
    return BlocListener<OnboardingBloc, OnboardingState>(
      listenWhen: (previous, current) {
        return (previous.currentScreenIndex != 2 && current.currentScreenIndex == 2) ||
            (previous.isOnboardingCompleted != current.isOnboardingCompleted && current.isOnboardingCompleted);
      },
      listener: (context, state) {
        if (state.isOnboardingCompleted) {
          context.router.replaceAll([const HomeRoute()]);
        } else if (state.currentScreenIndex == 2) {
          context.router.push(const PaywallRoute());
        }
      },
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final components = _buildOnboardingComponents(state.onboardingPageIndex);
          final currentScreenIndex = state.currentScreenIndex.clamp(0, components.length - 1);

          return Scaffold(
            body: OnboardingWrapper(
              bodyContent: components[currentScreenIndex].$1,
              backgroundImagePath: components[currentScreenIndex].$2,
              buttonText: components[currentScreenIndex].$3,
              onButtonPressed: components[currentScreenIndex].$4,
              footerContent: components[currentScreenIndex].$5,
            ),
          );
        },
      ),
    );
  }
}
