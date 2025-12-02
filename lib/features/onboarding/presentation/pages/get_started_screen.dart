import 'package:flutter/material.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/get_started_content.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: GetStartedContent()),
            Container(
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        PageRouteBuilder<void>(
                          pageBuilder: (_, _, _) => const OnboardingScreen(),
                          //with fade effect
                          transitionsBuilder: (_, animation, _, child) => FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: const Text('Get Started'),
                  ),
                  const SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text: 'By tapping next, you are agreeing to PlantID\n',
                      style: TextStyle(
                        color: AppColors.textTerms.withValues(alpha: .7),
                        fontSize: 11,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms of Use',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.textTerms.withValues(alpha: .7),
                          ),
                        ),
                        const TextSpan(text: ' & '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.textTerms.withValues(alpha: .7),
                          ),
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
