import 'package:flutter/material.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Payment Methode",),
      body: Placeholder(),
    );
  }
}
