part of 'home_bottom_bar.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    required this.iconPath,
    required this.label,
    required this.isActive,
    super.key,
    this.onTap,
    this.width = 74,
    this.height = 54,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.textSecondary,
    this.duration = const Duration(milliseconds: 300),
    this.padding = EdgeInsets.zero,
  });

  final String? iconPath;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;
  final Duration duration;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    if (iconPath == null) return SizedBox(width: width, height: height);

    final color = isActive ? activeColor : inactiveColor;

    return Padding(
      padding: padding,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: width.sp,
          maxWidth: (width + 30).sp,
          minHeight: height.sp,
          maxHeight: height.sp,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkResponse(
            radius: 30,
            splashColor: activeColor.withValues(alpha: 0.2),
            highlightColor: activeColor.withValues(alpha: 0.05),
            onTap: onTap,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  iconPath!,
                  width: 26.sp,
                  height: 26.sp,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                Flexible(
                  child: AnimatedDefaultTextStyle(
                    duration: duration,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: color,
                    ),
                    child: AnimatedOpacity(
                      duration: duration,
                      opacity: isActive ? 1.0 : 0.7,
                      child: Text(
                        label,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: color,
                        ),
                      ),
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
