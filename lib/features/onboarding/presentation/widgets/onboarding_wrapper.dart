import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({
    required this.bodyContent,
    required this.backgroundImagePath,
    required this.buttonText,
    required this.onButtonPressed,
    required this.footerContent,
    super.key,
  });

  final Widget bodyContent;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Widget footerContent;
  final String backgroundImagePath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImagePath),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 22.h),
                  child: bodyContent,
                ),
              ),
              SizedBox(
                height: .16.sh,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 4.h),
                  child: Column(
                    children: [
                      FilledButton(
                        onPressed: onButtonPressed,
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(Size(double.infinity, 56.h)),
                        ),
                        child: AutoSizeText(buttonText, style: TextStyle(fontSize: 16.sp)),
                      ),
                      SizedBox(height: 16.h),
                      footerContent,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
