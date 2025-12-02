import 'package:flutter/material.dart';
import 'package:plantapp/core/theme/app_colors.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/onboarding_one_content.dart';
import 'package:plantapp/features/onboarding/presentation/widgets/onboarding_two_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> getOnboardPage({required BuildContext context}) {
    return [
      const OnboardingOneContent(),
      const OnboardingTwoContent(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) => getOnboardPage(context: context)[index],
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemCount: getOnboardPage(context: context).length,
              ),
            ),
            Container(
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  FilledButton(
                    onPressed: () {
                      if (_currentIndex < getOnboardPage(context: context).length - 1) {
                        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Continue'),
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
