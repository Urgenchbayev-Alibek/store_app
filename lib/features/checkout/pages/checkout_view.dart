import 'package:flutter/material.dart';
import 'package:store_app/features/common/store_text_button.dart';

import '../../common/store_app_bar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Checkout"),
      body: Column(
        children: [

        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 107,
        child: StoreTextButton(
          text: "Place Order",
          width: 341,
          height: 54,
          callback: () {},
        ),
      ),
    );
  }
}
