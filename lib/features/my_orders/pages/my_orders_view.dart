import 'package:flutter/material.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "My Orders"),
      body: Center(
        child: Text("My Orders View"),
      ),
    );
  }
}
