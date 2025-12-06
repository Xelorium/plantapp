import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/features/home/presentation/widgets/home/home_header.dart';
import 'package:plantapp/features/home/presentation/widgets/home/home_premium_card.dart';

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
          HomeHeader(
            onSearchSubmitted: (query) => log('Search submitted: $query'),
          ),

          SizedBox(height: 24.sp),
          HomePremiumCard(
            onTap: () {},
          ),

          SizedBox(height: 24.sp),

          // Questions Section
          SizedBox(
            height: 164.sp,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              itemBuilder: (context, index) => Container(
                color: Colors.green,
                height: 164.sp,
                width: .75.sw,
              ),
              separatorBuilder: (context, index) => SizedBox(width: 10.sp),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
