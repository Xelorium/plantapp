import 'package:flutter/material.dart';
import 'package:plantapp/core/theme/app_theme.dart';

class PlantApp extends StatelessWidget {
  const PlantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(body: Center(child: Text('Hello World!'))),
      theme: AppTheme.lightTheme,
    );
  }
}
