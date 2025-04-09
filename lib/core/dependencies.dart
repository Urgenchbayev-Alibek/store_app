import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/features/auth/sign_up/bloc/sign_up_bloc.dart';

final List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(
    create: (context) => AuthRepository(client: context.read()),
  ),
  BlocProvider(create: (context) => SignUpBloc(authRepo: AuthRepository(client: context.read())),),
];
