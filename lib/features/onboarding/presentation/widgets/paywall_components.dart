import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/core/theme/app_colors.dart';

class PaywallFeatureCard extends StatelessWidget {
  const PaywallFeatureCard({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String iconPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .42.sw,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36.sp,
            width: 36.sp,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconPath,
              height: 18.sp,
              width: 18.sp,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          SizedBox(height: 10.sp),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 20.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.sp),
          Text(
            subtitle,
            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 13.sp),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class PaywallSubscriptionCard extends StatelessWidget {
  const PaywallSubscriptionCard({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
    this.badgeText,
    super.key,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;
  final String? badgeText;

  String get _badgeTextNonNull => badgeText ?? '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
              color: AppColors.paywallBackground,
              borderRadius: BorderRadius.circular(14),
              border: isSelected ? Border.all(color: AppColors.primary, width: 1.5) : Border.all(color: Colors.white30, width: 0.5),
            ),
            child: Row(
              children: [
                // Radio Button Icon
                Container(
                  width: 24.sp,
                  height: 24.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.primary : Colors.white10,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Colors.transparent,
                    ),
                  ),
                  child: isSelected ? Icon(Icons.circle, size: 10.sp, color: Colors.white) : null,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_badgeTextNonNull.isNotEmpty) ...[
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  _badgeTextNonNull,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
