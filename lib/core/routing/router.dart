import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';

import '../../features/auth/presentations/onboarding/pages/onboarding_view.dart';
import '../../features/auth/presentations/onboarding/pages/splash_screen_view.dart';
import '../../features/auth/presentations/sign_up/pages/sing_up_view.dart';
final GoRouter router = GoRouter(
  initialLocation: Routes.onboarding,
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreenView(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpView(),
    ),
  ],
);
