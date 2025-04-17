import 'package:flutter/material.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "FAQs"),
      body: Center(
        child: Text("FAQs view"),
      ),
    );
  }
}
