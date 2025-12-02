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
              height: MediaQuery.of(context).size.height * 0.15,
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
                  const SizedBox(height: 24), // Buton ile noktalar arası boşluk
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      getOnboardPage(context: context).length + 1, // Sayfa sayısı kadar nokta
                          (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: _currentIndex == index ? 10 : 6, // Aktif/Pasif yükseklik (Tasarımda hepsi yuvarlak görünüyor)
                          width: _currentIndex == index ? 10 : 6, // Aktif/Pasif genişlik (Tasarımda hepsi yuvarlak görünüyor)
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? AppColors.secondary // Aktif renk (Yeşil)
                                : AppColors.secondary.withValues(alpha: 0.25), // Pasif renk (Gri/Silik Yeşil)
                            shape: BoxShape.circle,
                          ),
                        );
                      },
                    ),
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
