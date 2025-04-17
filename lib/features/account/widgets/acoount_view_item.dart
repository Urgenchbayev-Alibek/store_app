import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class AccountViewItem extends StatelessWidget {
  const AccountViewItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final String icon, text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 24, height: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.primary,
                  fontFamily: "General Sans",
                  fontSize: 16,
                ),
              ),
            ),
            SvgPicture.asset("assets/icons/next.svg"),
          ],
        ),
      ),
    );
  }
}
