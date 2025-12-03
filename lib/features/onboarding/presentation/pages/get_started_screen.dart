import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';

@RoutePage()
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive scale factor
    double s = MediaQuery.of(context).size.width / 375.0;

    return BlocProvider(
      create: (context) => getIt<OnboardingCubit>(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            state.mapOrNull(
              completed: (_) {
                // TODO: Home sayfasına yönlendir
                // context.router.replace(const HomeRoute());
              },
              error: (state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              },
            );
          },
          builder: (context, state) {
            return Stack(
              children: [
                // Arkaplan Görseli
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/onboarding_bg.png', // Görselin yolu
                    fit: BoxFit.cover,
                  ),
                ),

                // İçerik
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0 * s),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20 * s),
                        Text(
                          'Welcome to\nPlantApp',
                          style: TextStyle(
                            fontSize: 28 * s,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // AppColors.black
                          ),
                        ),
                        SizedBox(height: 10 * s),
                        Text(
                          'Identify more than 3000+ plants and 88% accuracy.',
                          style: TextStyle(
                            fontSize: 16 * s,
                            color: Colors.black54,
                          ),
                        ),
                        const Spacer(),

                        // Buton
                        SizedBox(
                          width: double.infinity,
                          height: 56 * s,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<OnboardingCubit>().setOnboardingComplete();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // AppColors.primary
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12 * s),
                              ),
                            ),
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 16 * s,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40 * s),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}