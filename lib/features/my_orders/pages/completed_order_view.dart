import 'package:flutter/material.dart';
import '../../../core/sizes.dart';
import '../widgets/competed_order_view_item.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding25, vertical: 20),
      children: [
        CompletedOrderItem(
          imageUrl: 'assets/images/t-shirt.png',
          title: 'Regular Fit Slogan',
          size: 'M',
          price: '1,190',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'assets/images/t-shirt2.png',
          title: 'Regular Fit Polo',
          size: 'L',
          price: '1,100',
          isRated: true,
          rating: 4.5,
        ),
        CompletedOrderItem(
          imageUrl: 'assets/images/t-shirt3.png',
          title: 'Regular Fit Black',
          size: 'L',
          price: '1,690',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'assets/images/t-shirt4.png',
          title: 'Regular Fit V-Neck',
          size: 'S',
          price: '1,290',
          isRated: false,
        ),
        CompletedOrderItem(
          imageUrl: 'assets/images/t-shirt5.png',
          title: 'Regular Fit Pink',
          size: 'M',
          price: '1,341',
          isRated: true,
          rating: 3.5,
        ),
      ],
    );
  }
}
