import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/bottom_text.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/divider.dart';
import '../widgets/input_field.dart';
import '../widgets/social_button.dart';


class SignUpView extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailError;

  void validateEmail() {
    String email = emailController.text;
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(email)) {
      setState(() {
        emailError = "Enter a valid email address";
      });
    } else {
      setState(() {
        emailError = null;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text(
              "Create an account",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
            ),
             BottomText(),
          ],
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            InputField(label: "Full Name", hint: "Enter your full name", controller: fullNameController),
            InputField(label: "Email", hint: "Enter your email address", controller: emailController),
            InputField(label: "Password", hint: "Enter your password", controller: passwordController, isPassword: true),
            SizedBox(height: 20),
            TermsText(),
            SizedBox(height: 20),
            GestureDetector(
              onTap: validateEmail,
              child: CustomButton(text: "Create an Account", color: Colors.grey,callback: () => context.go(Routes.login),),
            ),
            SizedBox(height: 20),
            Dividerr(),
            SizedBox(height: 20),
            SocialButton(text: "Sign Up with Google", assetPath: 'assets/icons/google_logo.svg'),
            SizedBox(height: 20),
            SocialButton(text: "Sign Up with Facebook", assetPath: 'assets/icons/facebook_logo.svg', isFacebook: true),
          ],
        ),
      ),
        bottomNavigationBar:BottomNavigation(),
    );
  }
}

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
      style: TextStyle(fontSize: 14, color: Colors.black),
    );
  }
}



