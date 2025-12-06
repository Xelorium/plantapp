import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/core/navigation/app_router.dart';
import 'package:plantapp/core/theme/app_theme.dart';
import 'package:plantapp/features/onboarding/presentation/bloc/onboarding_bloc.dart';

class PlantApp extends StatelessWidget {
  const PlantApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
          create: (context) => getIt<OnboardingBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        ensureScreenSize: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
