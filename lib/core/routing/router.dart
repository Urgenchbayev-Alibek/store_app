import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import '../../features/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/pages/splash_screen_view.dart';


final GoRouter router = GoRouter(
  initialLocation: Routes.splashScreen,
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreenView(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(),
    ),
  ],
);
