import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/store_icon_button.dart';

import '../../core/utils/colors.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64,
      actionsPadding: EdgeInsets.only(right: 15),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: StoreIconButton(
            icon: "assets/icons/back_arrow.svg",
            width: 19,
            height: 16,
            callback: () => context.pop(),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 24,
          fontFamily: "General Sans",
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        StoreIconButton(
          icon: "assets/icons/notification.svg",
          width: 19,
          height: 20,
          callback: () {},
        ),
      ],
    );
  }
}
