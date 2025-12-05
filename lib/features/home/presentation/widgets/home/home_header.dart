import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(AppAssets.headerBackground),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.surface,
            BlendMode.modulate,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  'Hi, plant lover! ',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: theme.colorScheme.onSurface),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.sp),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Good Afternoon! ⛅',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, color: theme.colorScheme.onSurface),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.sp),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for plants',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: theme.colorScheme.onPrimary.withValues(alpha: .88),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.25)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
