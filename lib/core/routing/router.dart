import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/routing/routes.dart';

import '../../data/repositories/auth_repository.dart';
import '../../features/auth/forgot_password/bloc/reset_bloc.dart';
import '../../features/auth/forgot_password/pages/enter_otp_view.dart';
import '../../features/auth/forgot_password/pages/forgot_password_view.dart';
import '../../features/auth/forgot_password/pages/reset_password_view.dart';
import '../../features/auth/login/bloc/login_bloc.dart';
import '../../features/auth/login/pages/login_view.dart';
import '../../features/auth/sign_up/bloc/sign_up_bloc.dart';
import '../../features/auth/sign_up/pages/sing_up_view.dart';
import '../../features/checkout/pages/checkout_view.dart';
import '../../features/home/bloc/home_bloc.dart';
import '../../features/home/pages/home_view.dart';
import '../../features/notification/widgets/notifications_page.dart';
import '../../features/onboarding/managers/splash_screen_view_model.dart';
import '../../features/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/pages/splash_screen_view.dart';
import '../../main.dart';
import '../client.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.login,
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
    GoRoute(
      path: Routes.forgotPassword,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ResetPasswordBloc(
            authRepository: context.read<AuthRepository>(),
          ),
          child: const ForgotPasswordView(),
        );
      },
    ),
    GoRoute(
      path: Routes.enterOtp,
      builder: (context, state) {
        final email = state.extra;
        if (email is String) {
          return EnterOtpView(emailAddress: email);
        } else {
          throw Exception("Enter otp xatolik");
        }
      },
    ),
    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) {
        final extra = state.extra as Map<String, String>;
        final email = extra['email'] ?? '';
        final code = extra['code'] ?? '';

        return ResetPasswordView(email: email, code: code);
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc(
          repo: context.read(),
        ),
        child: HomeView(),
      ),
    ),

    GoRoute(
      path: Routes.notification,
      builder: (context, state) => NotificationsPage(),
    ),
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) => CheckoutView(),
    ),
  ],
);
