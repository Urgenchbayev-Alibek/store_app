import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/auth/presentations/onboarding/onboarding.dart';
import 'features/auth/presentations/sign_up/pages/sing_up_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HomePage(),
      routes: {
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:  SplashScreenView(),
//     );
//   }
// }
//
// class SplashScreenView extends StatelessWidget {
//   const SplashScreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             "assets/images/splash.png",
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Positioned(
//             bottom: 60,
//             child: SizedBox(
//               width: 64,
//               height: 64,
//               child: CircularProgressIndicator(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
