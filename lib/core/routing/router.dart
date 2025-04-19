import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:store_app/features/auth/sign_up/pages/sing_up_view.dart';
import 'package:store_app/features/faqs/pages/faqs_view.dart';
import 'package:store_app/features/my_cart/pages/my_cart_view.dart';
import 'package:store_app/features/my_details/pages/my_details_view1.dart';
import 'package:store_app/features/my_orders/pages/my_orders_view.dart';
import 'package:store_app/features/product_detail/pages/product_details_page.dart';
import 'package:store_app/main.dart';
import '../../features/account/pages/account_view.dart';
import '../../features/address/managers/new_address_bloc.dart';
import '../../features/address/pages/adress_page.dart';
import '../../features/address/pages/new_address_view.dart';
import '../../features/auth/forgot_password/bloc/reset_bloc.dart';
import '../../features/auth/forgot_password/pages/enter_otp_view.dart';
import '../../features/auth/forgot_password/pages/forgot_password_view.dart';
import '../../features/auth/forgot_password/pages/reset_password_view.dart';
import '../../features/auth/login/bloc/login_bloc.dart';
import '../../features/auth/login/pages/login_view.dart';
import '../../features/checkout/pages/checkout_view.dart';
import '../../features/help_center/pages/help_center_view.dart';
import '../../features/home/bloc/home_bloc.dart';
import '../../features/home/pages/home_view.dart';
import '../../features/notification/widgets/empty_notifications_page.dart';
import '../../features/notification/widgets/notifications_view.dart';
import '../../features/onboarding/managers/splash_screen_view_model.dart';
import '../../features/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/pages/splash_screen_view.dart';
import '../../features/payment_method/pages/new_card.dart';
import '../../features/payment_method/pages/payment_method_view.dart';
import '../../features/product_detail/pages/reviews_page.dart';
import '../../features/saved_items/pages/saved_item_view.dart';
import '../../features/search/pages/search_view.dart';
import '../client.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.myCart,
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
      path: Routes.notificationEmpty,
      builder: (context, state) => EmptyNotificationsPage(),
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
      path: Routes.productDetail,
      builder: (context, state) => ProductDetailsPage(),
    ),
    GoRoute(
      path: Routes.reviews,
      builder: (context, state) => ReviewsPage(),
    ),
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) => CheckoutView(),
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchPageView(
        isEmpty: false,
      ),
    ),
    GoRoute(
      path: Routes.myCart,
      builder: (context, state) => MyCartView(),
    ),
    GoRoute(
      path: Routes.newAddress,
      builder: (context, state) => BlocProvider(create: (context) => NewAddressBloc(), child: NewAddressView()),
    ),
    GoRoute(
      path: Routes.paymentMethod,
      builder: (context, state) => PaymentMethodView(),
    ),
    GoRoute(
      path: Routes.saved,
      builder: (context, state) => SavedItemView(),
    ),
    GoRoute(
      path: Routes.account,
      builder: (context, state) => AccountView(),
    ),
    GoRoute(
      path: Routes.addressPage,
      builder: (context, state) => AddressPage(),
    ),
    GoRoute(
      path: Routes.myOrders,
      builder: (context, state) => MyOrdersView(),
    ),
    GoRoute(
      path: Routes.faqs,
      builder: (context, state) => FAQsView(),
    ),
    GoRoute(
      path: Routes.helpCenter,
      builder: (context, state) => HelpCenterView(),
    ),
    GoRoute(
      path: Routes.myDetails,
      builder: (context, state) => MyDetailsView1(),
    ),
    GoRoute(
      path: Routes.newCard,
      builder: (context, state) => NewCardView(),
    )
  ],
);
