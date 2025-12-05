import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _currentIndex = _fabIndex),
        shape: const CircleBorder(),
        child: const Icon(Icons.camera_alt),
      ),

      body: IndexedStack(
        index: _currentIndex,
        children: const [HomePage(), DiagnosePage(), ScannerPage(), GardenPage(), ProfilePage()],
      ),

      bottomNavigationBar: HomeBottomBar(
        currentIndex: _currentIndex,
        onItemSelected: _selectTab,
      ),
    );
  }
}
