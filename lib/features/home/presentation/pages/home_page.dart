import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/features/home/presentation/widgets/home/home_header.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.sp),
        children: [
          const HomeHeader(),

          const SizedBox(height: 16),

          const SizedBox(height: 20),

          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
