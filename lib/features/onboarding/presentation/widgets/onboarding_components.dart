import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBodyContent extends StatelessWidget {
  const OnboardingBodyContent({required this.pageController, super.key});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .2.sh,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Take a photo to <b>identify</b>
          // the plant!
          //AutoSizeText.rich(
          //  textScaleFactor: 1,
          //  style: TextStyle(fontSize: 28.sp),
          //  minFontSize: 8,
          //  overflow: TextOverflow.ellipsis,
          //  const TextSpan(
          //    text: 'Take a photo to ',
          //    style: TextStyle(color: AppColors.secondary, fontWeight: FontWeight.w500),
          //    children: [
          //      TextSpan(
          //        text: 'identify',
          //        style: TextStyle(fontWeight: FontWeight.w800),
          //      ),
          //      TextSpan(
          //        text: '\nthe plant!',
          //        style: TextStyle(fontWeight: FontWeight.w500),
          //      ),
          //    ],
          //  ),
          //  maxLines: 2,
          //  textAlign: TextAlign.start,
          //),
        ],
      ),
    );
  }
}

class OnboardingFooterContent extends StatelessWidget {
  const OnboardingFooterContent({super.key, this.onTermsTap, this.onPrivacyTap});

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
          text: 'By tapping next, you are agreeing to PlantID\n',
          children: [
            TextSpan(
              text: 'Terms of Use',
              recognizer: TapGestureRecognizer()..onTap = onTermsTap,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            const TextSpan(
              text: ' & ',
              style: TextStyle(decoration: TextDecoration.none),
            ),
            TextSpan(
              text: 'Privacy Policy',
              recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            const TextSpan(
              text: '.',
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
