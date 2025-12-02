import 'package:flutter/material.dart';

class OnboardingOneContent extends StatelessWidget {
  const OnboardingOneContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 45, // Metne göre dikey konumu (Deneme-yanılma ile ayarlayın)
                    right: 45, // "identify" kelimesinin altına denk gelecek şekilde hizalayın
                    child: Image.asset(
                      'assets/images/brush_line.png', // Görsel yolunu buraya ekleyin
                      width: 126, // Çizgi genişliği
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Take a photo to ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.secondary,
                      ),
                      children: [
                        TextSpan(
                          text: 'identify\n',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        TextSpan(
                          text: 'the plant!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
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
            'assets/images/onboarding_1_background.png',
            fit: BoxFit.fitHeight,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.625,
          ),
        ),
      ],
    );
  }
}
