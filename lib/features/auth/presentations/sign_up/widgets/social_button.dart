import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String assetPath;
  final bool isFacebook;

  const SocialButton({
    required this.text,
    required this.assetPath,
    this.isFacebook = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341,
      height: 52,
      decoration: BoxDecoration(
        color: isFacebook ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: isFacebook ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}