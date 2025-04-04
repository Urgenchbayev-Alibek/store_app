// import 'dart:ui';
//
// import 'package:flutter/animation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:store_app/core/routing/routes.dart';
// import '../../main.dart';
// import '../client.dart';
//
// final router = GoRouter(
//   navigatorKey: navigatorKey,
//   initialLocation: Routes.onbordding,
//   routes: [
//     GoRoute(
//       path: Routes.home,
//       builder: (context, state) => BlocProvider(
//         create: (context) => HomeBloc(
//           catRepo: context.read(),
//           recipeRepo: context.read(),
//           chefRepo: context.read(),
//         ),
//         child: HomeView(),
//       ),
//     ),
//
//   ],
// );
