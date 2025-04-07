import 'package:store_app/core/client.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/main.dart';
import '../../features/auth/login/bloc/login_bloc.dart';
import '../../features/auth/login/pages/login_view.dart';
import '../../features/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/pages/splash_screen_view.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.login,
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
      path: Routes.login,
      builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(
                authRepository: AuthRepository(client: ApiClient()),
              ),
          child: LoginView()),
    ),
  ],
);
