import 'package:flutter/material.dart';
import 'package:store_app/core/sizes.dart';

import '../widgets/ongoing_view_item.dart';

class OngoingOrders extends StatelessWidget {
  const OngoingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding25, vertical: 20),
      children: [
        OngoingOrderItem(
          imageUrl: 'assets/images/t-shirt.png',
          title: 'Regular Fit Slogan',
          size: 'M',
          price: '1,190',
          status: 'In Transit',
        ),
        OngoingOrderItem(
          imageUrl: 'assets/images/t-shirt2.png',
          title: 'Regular Fit Slogan',
          size: 'L',
          price: '1,100',
          status: 'Picked',
        ),
        OngoingOrderItem(
          imageUrl: 'assets/images/t-shirt3.png',
          title: 'Regular Fit Slogan',
          size: 'L',
          price: '1,690',
          status: 'In Transit',
        ),
        OngoingOrderItem(
          imageUrl: 'assets/images/t-shirt4.png',
          title: 'Regular Fit Slogan',
          size: 'S',
          price: '1,290',
          status: 'Packing',
        ),
        OngoingOrderItem(
          imageUrl: 'assets/images/t-shirt5.png',
          title: 'Regular Fit Slogan',
          size: 'M',
          price: '1,341',
          status: 'Picked',
        ),
      ],
    );
  }
}
