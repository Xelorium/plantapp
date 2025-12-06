import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';

class GetStartedBodyContent extends StatelessWidget {
  const GetStartedBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            TextSpan(
              text: AppStrings.welcomeTo,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w400),
              children: const [
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
    );
  }
}

class GetStartedFooterContent extends StatelessWidget {
  const GetStartedFooterContent({super.key, this.onTermsTap, this.onPrivacyTap});

  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AutoSizeText.rich(
        style: TextStyle(fontSize: 11.sp),
        minFontSize: 4,
        overflow: TextOverflow.ellipsis,
        TextSpan(
          text: AppStrings.byTappingNext,
          children: [
            TextSpan(
              text: AppStrings.termsOfUse,
              recognizer: TapGestureRecognizer()..onTap = onTermsTap,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            const TextSpan(
              text: AppStrings.and,
              style: TextStyle(decoration: TextDecoration.none),
            ),
            TextSpan(
              text: AppStrings.privacyPolicy,
              recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            const TextSpan(
              text: AppStrings.period,
              style: TextStyle(decoration: TextDecoration.none),
            ),
          ],
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
