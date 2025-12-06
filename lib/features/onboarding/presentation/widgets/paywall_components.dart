import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/core/theme/app_spacings.dart';
import 'package:plantapp/core/theme/app_text_styles.dart';

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
      padding: AppSpacings.cardPadding,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(14), // keeping 14? Spacings has radius 12. Let's stick to consistent radius if possible, or create s14. The design might require slightly diff radius. I'll use Spacings.radius (12) for consistency unless visual break.
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
          SizedBox(height: AppSpacings.s12), // 10.sp -> close to s12 or s8? s12 is safer.
          Text(
            title,
            style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 20.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.sp), // keep 4.sp or s4
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 13.sp),
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
            transformAlignment: Alignment.topLeft,
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
              color: AppColors.paywallBackground,
              borderRadius: BorderRadius.circular(14), // Use consistent radius? 14 seems specific to paywall.
              border: isSelected ? Border.all(color: AppColors.primary, width: 1.5) : Border.all(color: Colors.white30, width: 0.5),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
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
                SizedBox(width: AppSpacings.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyLarge.copyWith(
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
                        style: AppTextStyles.bodySmall.copyWith(
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
