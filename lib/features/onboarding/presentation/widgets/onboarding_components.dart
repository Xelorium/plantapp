import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBodyContent extends StatelessWidget {
  const OnboardingBodyContent({
    required this.pageController,
    required this.onPageChanged,
    required this.pages,
    super.key,
  });

  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .2.sh,
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: pages.length,
        itemBuilder: (context, index) => pages[index],
      ),
    );
  }
}

class OnboardingFooterContent extends StatelessWidget {
  const OnboardingFooterContent({
    required this.currentIndex,
    required this.pageCount,
    super.key,
  });

  final int currentIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pageCount, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            height: 10.h,
            width: currentIndex == index ? 10.sp : 6.sp,
            decoration: BoxDecoration(
              color: currentIndex == index ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.25),
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}
