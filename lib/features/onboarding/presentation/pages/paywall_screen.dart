import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/features/onboarding/domain/models/subscription_plan.dart';
import 'package:plantapp/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/paywall_components.dart';

@RoutePage()
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  List<(String iconPath, String title, String subtitle)> get features => [
    // MB TODO: STRINGIFY
    (AppAssets.scannerFeatureIconSvg, 'Unlimited', 'Plant Identify'),
    (AppAssets.speedFeatureIconSvg, 'Faster', 'Process'),
    (AppAssets.speedFeatureIconSvg, 'Detailed', 'Plant care'),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) return;
        context.read<OnboardingBloc>().add(const OnboardingEvent.closePaywall());
      },
      child: Scaffold(
        backgroundColor: AppColors.paywallBackground,
        body: SafeArea(
          top: false,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.paywallBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.sp, top: 24.sp, right: 20.sp, bottom: 24.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SafeArea(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                  icon: Container(
                                    padding: EdgeInsets.all(6.sp),
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black45),
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.onPrimary,
                                      size: 18.sp,
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<OnboardingBloc>().add(const OnboardingEvent.closePaywall());
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ),
                          ),
                          AutoSizeText.rich(
                            const TextSpan(
                              text: AppConstants.appName,
                              children: [
                                TextSpan(
                                  // MB TODO: STRINGIFY
                                  text: ' Premium',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 27.sp,
                              color: AppColors.onPrimary,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          AutoSizeText(
                            // MB TODO: STRINGIFY
                            'Access All Features',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: AppColors.onPrimary.withValues(alpha: .7),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 24.sp),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            child: Row(
                              children: List.generate(
                                features.length,
                                (index) {
                                  final feature = features[index];
                                  return Padding(
                                    padding: EdgeInsets.only(right: 8.sp),

                                    child: PaywallFeatureCard(
                                      iconPath: feature.$1,
                                      title: feature.$2,
                                      subtitle: feature.$3,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 24.sp),
                          BlocBuilder<OnboardingBloc, OnboardingState>(
                            builder: (context, state) {
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: SubscriptionPlan.availablePlans.length,
                                separatorBuilder: (context, index) => SizedBox(height: 16.sp),
                                itemBuilder: (context, index) {
                                  final plan = SubscriptionPlan.availablePlans[index];
                                  return PaywallSubscriptionCard(
                                    title: plan.title,
                                    subtitle: plan.subtitle,
                                    isSelected: state.selectedSubscriptionPlanId == plan.id,
                                    badgeText: plan.badgeText,
                                    onTap: () => context.read<OnboardingBloc>().add(
                                      OnboardingEvent.selectSubscriptionPlan(plan.id),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  _Footer(
                    onTryButtonPressed: () => context.read<OnboardingBloc>().add(const OnboardingEvent.completeOnboarding()),
                    onPrivacyPressed: () {},
                    onRestorePressed: () {},
                    onTermsPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    this.onPrivacyPressed,
    this.onRestorePressed,
    this.onTermsPressed,
    this.onTryButtonPressed,
  });

  final VoidCallback? onTryButtonPressed;
  final VoidCallback? onTermsPressed;
  final VoidCallback? onPrivacyPressed;
  final VoidCallback? onRestorePressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .16.sh,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 4.sp),
        child: Column(
          children: [
            FilledButton(
              onPressed: onTryButtonPressed,
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(double.infinity, 56.sp)),
              ),
              // MB TODO: STRINGIFY
              child: AutoSizeText('Try for 3 days', style: TextStyle(fontSize: 16.sp)),
            ),
            SizedBox(height: 8.sp),
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    child: AutoSizeText(
                      // MB TODO: STRINGIFY
                      'After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel\nbefore the trial expires. Yearly Subscription is Auto-Renewable',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      minFontSize: 2,
                      maxFontSize: 9,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText.rich(
                      TextSpan(
                        // MB TODO: STRINGIFY
                        text: 'Terms',
                        recognizer: TapGestureRecognizer()..onTap = onTermsPressed,
                        children: [
                          const TextSpan(text: '  •  '),
                          // MB TODO: STRINGIFY
                          TextSpan(text: 'Privacy', recognizer: TapGestureRecognizer()..onTap = onPrivacyPressed),
                          // MB TODO: STRINGIFY
                          const TextSpan(text: '  •  '),
                          // MB TODO: STRINGIFY
                          TextSpan(text: 'Restore', recognizer: TapGestureRecognizer()..onTap = onRestorePressed),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 2,
                      maxFontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
