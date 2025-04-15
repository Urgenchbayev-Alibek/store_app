import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Let’s create your account.",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),

    );
  }
}