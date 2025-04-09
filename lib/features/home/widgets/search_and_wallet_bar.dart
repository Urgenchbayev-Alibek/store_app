import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'center_dialog.dart';

class HomeView extends StatelessWidget implements PreferredSizeWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Text(
          'Discover',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      leadingWidth: 200,
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const CenterDialog(),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/no_notification.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
