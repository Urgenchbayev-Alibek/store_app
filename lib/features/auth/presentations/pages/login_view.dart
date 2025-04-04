import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('✅ Login muvaffaqiyatli!')),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('❌ Xato: ${state.error}')),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login to your account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                SizedBox(height: 10),
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(labelText: "Email"),
                ),

                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),

                SizedBox(height: 20),
                state is LoginLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(
                      LoginButtonPressed(
                        login: _loginController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                  child: Text("Login"),
                ),

                SizedBox(height: 20),
                Text("Or"),

                SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("Login with Google"),
                  onPressed: () {},
                ),

                SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: Icon(Icons.facebook),
                  label: Text("Login with Facebook"),
                  onPressed: () {},
                ),

                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text("Don't have an account? Join"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
