import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';

@RoutePage()
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardingCubit>(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 22.h),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/get_started_bg.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      child: SizedBox(
                        height: .2.sh,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText.rich(
                              textScaleFactor: 1,
                              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                              minFontSize: 8,
                              overflow: TextOverflow.ellipsis,
                              const TextSpan(
                                text: 'Welcome to ',
                                style: TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    text: AppConstants.appName,
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 8.h),
                            AutoSizeText(
                              AppStrings.onboardingSubtitle,
                              textScaleFactor: 1,
                              style: TextStyle(fontSize: 16.sp),
                              minFontSize: 8,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: .16.sh,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        bottom: 4.h,
                      ),
                      child: Column(
                        children: [
                          FilledButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              fixedSize: WidgetStatePropertyAll(
                                Size(double.infinity, 56.h),
                              ),
                            ),
                            child: AutoSizeText(
                              AppStrings.getStarted,
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Flexible(
                            child: AutoSizeText.rich(
                              style: TextStyle(fontSize: 11.sp),
                              minFontSize: 4,
                              overflow: TextOverflow.ellipsis,
                              const TextSpan(
                                text: 'By tapping next, you are agreeing to PlantID\n',
                                children: [
                                  TextSpan(
                                    text: 'Terms of Use',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationStyle: TextDecorationStyle.solid,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' & ',
                                    style: TextStyle(decoration: TextDecoration.none),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationStyle: TextDecorationStyle.solid,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '.',
                                    style: TextStyle(decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
