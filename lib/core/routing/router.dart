import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:store_app/features/auth/sign_up/pages/sing_up_view.dart';
import 'package:store_app/features/home/pages/home_view.dart';
import 'package:store_app/main.dart';

import '../../features/auth/forgot_password/pages/enter_otp_view.dart';
import '../../features/auth/forgot_password/pages/forgot_password_view.dart';
import '../../features/auth/forgot_password/pages/reset_password_view.dart';
import '../../features/auth/login/bloc/login_bloc.dart';
import '../../features/auth/login/pages/login_view.dart';
import '../../features/onboarding/managers/splash_screen_view_model.dart';
import '../../features/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/pages/splash_screen_view.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.splashScreen,
  routes: [
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => SplashScreenViewModel(),
          lazy: false,
          child: SplashScreenView(),
        );
      },
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
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => BlocProvider(
        create: (context) => SignUpBloc(
          authRepo: AuthRepository(client: ApiClient()),
        ),
        child: SignUpView(),
      ),
    ),
    GoRoute(path: Routes.forgotPassword, builder: (context, state) => ForgotPasswordView()),
    GoRoute(
      path: Routes.enterOtp,
      builder: (context, state) {
        return EnterOtpView(emailAddress: state.extra == null ? "Example@example.com" : state.extra as String);
      },
    ),
    GoRoute(path: Routes.resetPassword, builder: (context, state) => ResetPasswordView()),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomeView(),
    ),
  ],
);
