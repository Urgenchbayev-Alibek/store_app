import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAndWalletBar extends StatelessWidget {
  const SearchAndWalletBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/no_result.svg',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Search for clothes...',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/microphone.svg',
                  width: 17,
                  height: 21,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/wallet.svg',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
