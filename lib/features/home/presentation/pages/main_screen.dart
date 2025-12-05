import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/navigation/app_router.gr.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/features/home/presentation/widgets/home_bottom_bar.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const int _fabIndex = 2;
  int _currentIndex = 0;

  void _selectTab(int index) {
    setState(() => _currentIndex = index);

    // For tab index 0 (home), we stay on the current screen
    // For other tabs, we navigate to the nested routes
    switch (index) {
      case 0:
        context.router.navigate(const HomeRoute());
        break;
      case 1:
        context.router.navigate(const DiagnoseRoute());
        break;
      case 2:
        context.router.navigate(const ScannerRoute());
        break;
      case 3:
        context.router.navigate(const GardenRoute());
        break;
      case 4:
        context.router.navigate(const ProfileRoute());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 66.sp,
        height: 66.sp,
        child: FloatingActionButton(
          onPressed: () => _selectTab(_fabIndex),
          foregroundColor: AppColors.fbaBackground,
          elevation: 0,
          shape: CircleBorder(
            side: BorderSide(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.24),
              width: 4.sp,
            ),
          ),
          child: SvgPicture.asset(
            AppAssets.navBarScannerSvg,
            width: 26.sp,
            height: 26.sp,
          ),
        ),
      ),

      body: const AutoRouter(),

      bottomNavigationBar: HomeBottomBar(
        currentIndex: _currentIndex,
        onItemSelected: _selectTab,
      ),
    );
  }
}
