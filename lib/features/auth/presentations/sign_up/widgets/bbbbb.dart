import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ",style: TextStyle(color: Colors.grey,fontSize:16,fontWeight: FontWeight.w400),),
        Text("Log In",style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.w400),),
        SizedBox(height:100),
      ],
    );
  }
}