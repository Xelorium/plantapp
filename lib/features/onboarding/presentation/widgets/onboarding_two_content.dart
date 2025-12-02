import 'package:flutter/material.dart';

class OnboardingTwoContent extends StatelessWidget {
  const OnboardingTwoContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text.rich(
              TextSpan(
                text: 'Get plant ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.secondary,
                ),
                children: [
                  TextSpan(
                    text: 'care guides',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/onboarding_2_background.png',
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ],
    );
  }
}
