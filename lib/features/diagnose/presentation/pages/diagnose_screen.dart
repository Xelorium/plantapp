import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:plantapp/core/constants/app_constants.dart';

@RoutePage()
class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStrings.diagnose,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
