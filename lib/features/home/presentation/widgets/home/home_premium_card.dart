import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/core/widgets/gradient_text.dart';

class HomePremiumCard extends StatelessWidget {
  const HomePremiumCard({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.sp,
        right: 10.sp,
        bottom: 12.sp,
        top: 12.sp,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: AppColors.premiumBannerBackground, borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
          child: Row(
            children: [
              Badge.count(
                count: 1,
                offset: const Offset(-4, 2),
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onSecondary,
                ),
                child: SizedBox(
                  width: 50.sp,
                  child: SvgPicture.asset(AppAssets.mailIconSvg, fit: BoxFit.fitWidth),
                ),
              ),
              SizedBox(width: 12.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientRichText(
                      textSpan: TextSpan(
                        text: AppStrings.free,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                          color: AppColors.onSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: AppStrings.premiumAvailable,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0,
                              color: AppColors.onSecondary,
                            ),
                          ),
                        ],
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.premiumBannerTextHighlight,
                          AppColors.premiumBannerTextHighlight,
                          AppColors.premiumBannerTextHighlight,
                          AppColors.premiumBannerTextSecondaryHighlight,
                        ],
                      ),
                    ),

                    GradientText(
                      AppStrings.tapToUpgrade,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.premiumBannerTextSecondaryHighlight,
                          AppColors.premiumBannerTextHighlight,
                          AppColors.premiumBannerTextHighlight,
                          AppColors.premiumBannerTextHighlight,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4.sp),
              SvgPicture.asset(
                AppAssets.rightArrowIconSvg,
                height: 24.sp,
                width: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
