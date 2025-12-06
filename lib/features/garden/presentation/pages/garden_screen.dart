import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:plantapp/core/constants/app_constants.dart';

@RoutePage()
class GardenScreen extends StatelessWidget {
  const GardenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStrings.myGarden,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
