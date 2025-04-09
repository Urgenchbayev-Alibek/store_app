import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../notification/widgets/empty_notifications_page.dart';
import '../../notification/widgets/notifications_page.dart';

class CenterDialog extends StatelessWidget {
  const CenterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        '"App" Would Like To Send You\nNotifications',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'Notifications may include alerts,\nsounds, and icon badges. These can be\nconfigured in Settings.',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isDestructiveAction: false,
          textStyle: TextStyle(
            color: CupertinoColors.activeBlue,
          ),
          child: Text("Don't Allow"),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NotificationsPage(),
              ),
            );
          },
          isDefaultAction: true,
          textStyle: TextStyle(
            color: CupertinoColors.activeBlue,
          ),
          child: Text("Allow"),
        ),
      ],
    );
  }
}
