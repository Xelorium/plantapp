import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/navigation/app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {



  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    CustomRoute<void>(
      page: PaywallRoute.page,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      fullscreenDialog: true,
      predictiveBackPageTransitionsBuilder: (context, animation, secondaryAnimation, child) {
        return TransitionsBuilders.slideBottom(context, animation, secondaryAnimation, child);
      },
    ),
  ];
}
