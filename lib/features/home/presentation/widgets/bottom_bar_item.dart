part of 'home_bottom_bar.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    required this.icon,
    required this.label,
    required this.isActive,
    super.key,
    this.onTap,
    this.width = 70,
    this.height = 72,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.scale = 1.15,
    this.duration = const Duration(milliseconds: 200),
  });

  final IconData? icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;
  final double scale;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    if (icon == null) return SizedBox(width: width, height: height);

    final color = isActive ? activeColor : inactiveColor;

    return SizedBox(
      width: width,
      height: height,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1, end: isActive ? scale : 1.0),
        duration: duration,
        curve: Curves.easeOut,
        builder: (context, value, _) {
          return Material(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: value,
                    child: Icon(icon, size: 24, color: color),
                  ),
                  const SizedBox(height: 4),
                  AnimatedDefaultTextStyle(
                    duration: duration,
                    style: TextStyle(
                      fontSize: isActive ? 12 : 11,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      color: color,
                    ),
                    child: AnimatedOpacity(
                      duration: duration,
                      opacity: isActive ? 1.0 : 0.7,
                      child: AnimatedSlide(
                        duration: duration,
                        offset: isActive ? Offset.zero : const Offset(0, 0.2),
                        child: Text(label),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
