import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/store_icon_button.dart';

import '../../core/routing/routes.dart';
import '../../core/utils/colors.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({
    super.key,
    required this.title,
    this.showLeading = true,
    this.centerTitle = true,
    this.toolbarHeight=56,
    this.bottom,
  });

  final String title;
  final bool showLeading;
  final bool centerTitle;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height =
    bottomHeight == null ? toolbarHeight : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leadingWidth: showLeading ? 64 : 0,
      actionsPadding: const EdgeInsets.only(right: 15),
      leading: showLeading
          ? Padding(
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
            )
          : null,
      centerTitle: centerTitle,
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
          callback: () {
            context.push(Routes.notification);
          },
        ),
      ],
      bottom: bottom ?? null,
    );
  }
}
