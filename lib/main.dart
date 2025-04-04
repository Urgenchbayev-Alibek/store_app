import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/core/routing/router.dart';

import 'features/auth/presentations/onboarding/onboarding.dart';
import 'features/auth/presentations/sign_up/pages/sing_up_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());

}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

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
//     return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           routerConfig: router,
//         );
//       }
//     }



