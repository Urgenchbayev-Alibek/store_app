import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Define\nyourself in\nyour unique\nway",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/signup');
        },
        child: Container(
          width: 341,
          height: 54,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              SvgPicture.asset(
                'assets/arrow.svg',
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

