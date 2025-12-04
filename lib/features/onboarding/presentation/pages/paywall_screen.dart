import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/theme/app_colors.dart';

@RoutePage()
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

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
              children: [
                const Expanded(child: SizedBox()),
                SizedBox(
                  height: .16.sh,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 4.h),
                    child: Column(
                      children: [
                        FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(Size(double.infinity, 56.h)),
                          ),
                          child: AutoSizeText('Try for 3 days', style: TextStyle(fontSize: 16.sp)),
                        ),
                        SizedBox(height: 8.h),
                        const Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: AutoSizeText(
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
                                    text: 'Terms',
                                    children: [
                                      TextSpan(text: '  •  '),
                                      TextSpan(text: 'Privacy'),
                                      TextSpan(text: '  •  '),
                                      TextSpan(text: 'Restore'),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
