import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/main.dart';
import '../../features/auth/login/bloc/login_bloc.dart';
import '../../features/auth/login/pages/login_view.dart';
import '../../features/auth/sign_up/pages/sing_up_view.dart';
import '../../features/home/pages/home_view.dart';
import '../../features/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/pages/splash_screen_view.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.home,
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
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => DiscoverPage(),
    ),
  ],
);
