import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';

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
    );
  }
}

class OnboardingFooterContent extends StatefulWidget {
  const OnboardingFooterContent({super.key});

  @override
  State<OnboardingFooterContent> createState() => _OnboardingFooterContentState();
}

class _OnboardingFooterContentState extends State<OnboardingFooterContent> {
  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: SizedBox(),
    );
  }
}
