import 'package:flutter/material.dart';

class DiscoverItems extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/t-shirt.png',
    'assets/images/t-shirt.png',
    'assets/images/t-shirt.png',
    'assets/images/t-shirt.png',
    'assets/images/t-shirt.png',
    'assets/images/t-shirt.png',
    'assets/images/t-shirt.png',
    'assets/images/t-shirt.png',
  ];

  final List<String> titles = [
    'Regular Fit Slogan',
    'Regular Fit Polo',
    'Regular Fit Black',
    'Regular Fit V-Neck',
    'Regular Fit Cotton',
    'Regular Fit Stripes',
    'Regular Fit Cotton',
    'Regular Fit Stripes',
  ];
  final List<String> money = [
    '1,190',
    '1,100 -52%',
    '1,690',
    '1,290',
    '1,190',
    '1,290',
    '1,690',
    '1,190',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: (imagePaths.length / 2).ceil(),
        itemBuilder: (context, index) {
          int firstIndex = index * 2;
          int secondIndex = firstIndex + 1;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildItemCard(imagePaths[firstIndex], titles[firstIndex],money[firstIndex]),
                if (secondIndex < imagePaths.length)
                  buildItemCard(imagePaths[secondIndex], titles[secondIndex],money[firstIndex])
                else
                  SizedBox(width: 161),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildItemCard(String imagePath, String title,String money) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 161,
          height: 174,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height:6),
        Text(
          money,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
