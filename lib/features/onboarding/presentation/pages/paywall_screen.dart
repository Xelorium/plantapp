import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/theme/app_colors.dart';
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
    return Scaffold(
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
                    padding: EdgeInsets.only(left: 20.w, top: 60.h, right: 20.w, bottom: 24.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        SizedBox(height: 24.h),

                        SizedBox(
                          height: 124.sp,
                          child: ListView.separated(
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) {
                              final feature = features[index];

                              return PaywallFeatureCard(
                                iconPath: feature.$1,
                                title: feature.$2,
                                subtitle: feature.$3,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(width: 8.w),
                            itemCount: features.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _Footer(
                  key: key,
                  onTryButtonPressed: () {},
                  onPrivacyPressed: () {},
                  onRestorePressed: () {},
                  onTermsPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    super.key,
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
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 4.h),
        child: Column(
          children: [
            FilledButton(
              onPressed: onTryButtonPressed,
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(double.infinity, 56.h)),
              ),
              // MB TODO: STRINGIFY
              child: AutoSizeText('Try for 3 days', style: TextStyle(fontSize: 16.sp)),
            ),
            SizedBox(height: 8.h),
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
