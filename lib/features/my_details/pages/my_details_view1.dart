import 'package:flutter/material.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class MyDetailsView1 extends StatelessWidget {
  const MyDetailsView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "My Details"),
      body: Center(
        child: Text("My Details View"),
      ),
    );
  }
}
