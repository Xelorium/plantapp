import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/paywall_components.dart';

class SubscriptionPlan {
  const SubscriptionPlan({
    required this.id,
    required this.title,
    required this.subtitle,
    this.badgeText,
  });

  final String id;
  final String title;
  final String subtitle;
  final String? badgeText;
}

@RoutePage()
class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  String? selectedPlanId;

  List<SubscriptionPlan> get subscriptionPlans => [
    const SubscriptionPlan(
      id: 'monthly',
      title: '1 Month',
      subtitle: r'$32.99 per month, auto renewable',
    ),
    const SubscriptionPlan(
      id: 'yearly',
      title: '1 Year',
      subtitle: r'First 3 days free, then $529,99/year',
      badgeText: 'Save 50%',
    ),
  ];

  @override
  void initState() {
    super.initState();
    selectedPlanId = subscriptionPlans.isNotEmpty ? subscriptionPlans.first.id : null;
  }

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
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: subscriptionPlans.length,
                          separatorBuilder: (context, index) => SizedBox(height: 16.sp),
                          itemBuilder: (context, index) {
                            final plan = subscriptionPlans[index];
                            return PaywallSubscriptionCard(
                              title: plan.title,
                              subtitle: plan.subtitle,
                              isSelected: selectedPlanId == plan.id,
                              badgeText: plan.badgeText,
                              onTap: () => setState(() => selectedPlanId = plan.id),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                _Footer(
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
