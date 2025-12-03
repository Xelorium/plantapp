import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/get_started_components.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/onboarding_wrapper.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardingCubit>(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return OnboardingWrapper(
              bodyContent: const GetStartedBodyContent(),
              backgroundImagePath: AppAssets.getStartedBackground,
              buttonText: AppStrings.getStarted,
              onButtonPressed: () {},
              footerContent: GetStartedFooterContent(
                onPrivacyTap: () {},
                onTermsTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
