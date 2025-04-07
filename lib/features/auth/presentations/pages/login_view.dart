import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoginValid = false;
  bool isPasswordValid = false;
  bool _obscurePassword = true;

  void validateInputs() {
    setState(() {
      isLoginValid = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
          .hasMatch(_loginController.text);
      isPasswordValid = _passwordController.text.length >= 6;
    });
  }

  OutlineInputBorder customBorder(bool isValid) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: isValid ? Colors.green : Colors.red,
        width: 1.5,
      ),
    );
  }

  Icon? suffixIcon(bool isValid, String text) {
    if (text.isEmpty) return null;
    return Icon(
      Icons.check_circle,
      color: isValid ? Colors.green : Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login to your account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "It's great to see you again.",
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 24),
              TextField(
                controller: _loginController,
                onChanged: (_) => validateInputs(),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: _loginController.text.isEmpty
                      ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      : customBorder(isLoginValid),
                  focusedBorder: customBorder(isLoginValid),
                  suffixIcon: suffixIcon(isLoginValid, _loginController.text),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                onChanged: (_) => validateInputs(),
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: _passwordController.text.isEmpty
                      ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      : customBorder(isPasswordValid),
                  focusedBorder: customBorder(isPasswordValid),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_passwordController.text.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(
                            isPasswordValid
                                ? Icons.check_circle
                                : Icons.error,
                            color: isPasswordValid ? Colors.green : Colors.red,
                          ),
                        ),
                      IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ],
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Text(
                    "Reset your password",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  validateInputs();
                },
                child: Text("Login"),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),
              OutlinedButton.icon(
                icon: SvgPicture.asset("assets/icons/google_logo.svg",
                    height: 20, width: 20),
                label: Text("Login with Google"),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1877F2),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                icon: SvgPicture.asset("assets/icons/facebook.svg",
                    height: 20, width: 20, color: Colors.white),
                label: Text("Login with Facebook"),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Don't have an account? Join",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Hi extends StatelessWidget {
  const Hi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
