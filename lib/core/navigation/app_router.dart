import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/core/navigation/app_router.gr.dart';
import 'package:plantapp/core/services/app_initialization_service.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  bool get _isOnboardingComplete {
    try {
      final appInitializationService = getIt<AppInitializationService>();
      return appInitializationService.isOnboardingComplete;
    } catch (e) {
      return false;
    }
  }

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: !_isOnboardingComplete),
    CustomRoute<void>(
      page: PaywallRoute.page,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      fullscreenDialog: true,
      predictiveBackPageTransitionsBuilder: TransitionsBuilders.slideBottom,
    ),
    CustomRoute<void>(
      page: MainRoute.page,
      initial: _isOnboardingComplete,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        CustomRoute<void>(page: HomeRoute.page, initial: _isOnboardingComplete, transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute<void>(page: DiagnoseRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute<void>(page: ScannerRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute<void>(page: GardenRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute<void>(page: ProfileRoute.page, transitionsBuilder: TransitionsBuilders.fadeIn),
      ],
    ),
  ];
}
