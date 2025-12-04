import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plantapp/core/constants/app_constants.dart';

@RoutePage()
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.paywallBackground),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
