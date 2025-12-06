import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/theme/app_colors.dart';

part 'bottom_bar_item.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({
    required this.currentIndex,
    required this.onItemSelected,
    super.key,
    this.fabIndex = 2,
  });

  final int currentIndex;
  final ValueChanged<int> onItemSelected;
  final int fabIndex;

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  final List<BottomBarItem> _tabs = [
    const BottomBarItem(
      iconPath: AppAssets.navBarHomeSvg,
      label: AppStrings.home,
      isActive: false,
    ),
    const BottomBarItem(
      iconPath: AppAssets.navBarDiagnoseSvg,
      label: AppStrings.diagnose,
      isActive: false,
    ),
    const BottomBarItem(
      iconPath: null,
      label: AppStrings.empty,
      isActive: false,
    ),
    const BottomBarItem(
      iconPath: AppAssets.navBarGardenSvg,
      label: AppStrings.myGarden,
      isActive: false,
    ),
    const BottomBarItem(
      iconPath: AppAssets.navBarProfileSvg,
      label: AppStrings.profile,
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final leftTabs = _tabs.sublist(0, widget.fabIndex);
    final rightTabs = _tabs.sublist(widget.fabIndex + 1);

    final theme = Theme.of(context);

    return BottomAppBar(
      height: 80.sp,
      notchMargin: 0,
      padding: EdgeInsets.zero,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: theme.colorScheme.onSurface.withValues(alpha: .1),
              width: 1.sp,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                for (int i = 0; i < leftTabs.length; i++)
                  BottomBarItem(
                    iconPath: leftTabs[i].iconPath,
                    label: leftTabs[i].label,
                    isActive: widget.currentIndex == i,
                    padding: EdgeInsets.only(right: i == 0 ? 2.sp : 0),
                    onTap: () => widget.onItemSelected(i),
                  ),
              ],
            ),

            Row(
              children: [
                for (int i = 0; i < rightTabs.length; i++)
                  BottomBarItem(
                    iconPath: rightTabs[i].iconPath,
                    label: rightTabs[i].label,
                    isActive: widget.currentIndex == i + widget.fabIndex + 1,
                    padding: EdgeInsets.only(left: i == rightTabs.length - 1 ? 2.sp : 0),
                    onTap: () => widget.onItemSelected(i + widget.fabIndex + 1),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
