import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/features/home/presentation/pages/home_page.dart';
import 'package:plantapp/features/home/presentation/widgets/home_bottom_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const int _fabIndex = 2;

  void _selectTab(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
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
          onPressed: () => setState(() => _currentIndex = _fabIndex),
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

      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomePage(),
          DiagnosePage(),
          ScannerPage(),
          GardenPage(),
          ProfilePage(),
        ],
      ),

      bottomNavigationBar: HomeBottomBar(
        currentIndex: _currentIndex,
        onItemSelected: _selectTab,
      ),
    );
  }
}
