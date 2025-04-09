import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterDialog extends StatelessWidget {
  const CenterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 273,
        height: 173,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 24,
              offset: Offset(0, 16),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'This is a shadow dialog',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
