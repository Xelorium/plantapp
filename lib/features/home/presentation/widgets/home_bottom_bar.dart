import 'package:flutter/material.dart';

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
      icon: Icons.home_outlined,
      label: 'Home',
      isActive: false,
    ),
    const BottomBarItem(
      icon: Icons.favorite_border,
      label: 'Diagnose',
      isActive: false,
    ),
    const BottomBarItem(
      icon: null,
      label: '',
      isActive: false,
    ),
    const BottomBarItem(
      icon: Icons.notifications_outlined,
      label: 'My Garden',
      isActive: false,
    ),
    const BottomBarItem(
      icon: Icons.person_outline,
      label: 'Profile',
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final leftTabs = _tabs.sublist(0, widget.fabIndex);
    final rightTabs = _tabs.sublist(widget.fabIndex + 1);

    return BottomAppBar(
      height: 72,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT SIDE
          Row(
            children: [
              for (int i = 0; i < leftTabs.length; i++)
                BottomBarItem(
                  icon: leftTabs[i].icon,
                  label: leftTabs[i].label,
                  isActive: widget.currentIndex == i,
                  onTap: () => widget.onItemSelected(i),
                ),
            ],
          ),

          // RIGHT SIDE
          Row(
            children: [
              for (int i = 0; i < rightTabs.length; i++)
                BottomBarItem(
                  icon: rightTabs[i].icon,
                  label: rightTabs[i].label,
                  isActive: widget.currentIndex == i + widget.fabIndex + 1,
                  onTap: () => widget.onItemSelected(i + widget.fabIndex + 1),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
