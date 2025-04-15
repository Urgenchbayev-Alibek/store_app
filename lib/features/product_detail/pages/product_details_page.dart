import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Details', style: TextStyle(color: Colors.black)),
        leading: BackButton(color: Colors.black),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_horiz, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/Container.png',
                    width: 341,// double.infinity
                    height: 368,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Regular Fit Slogan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 4),
                    Text('4.0/5', style: TextStyle(color: Colors.orange)),
                    SizedBox(width: 6),
                    Text('(45 reviews)', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Choose size',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: ['S', 'M', 'L'].map((size) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    size,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                );
              }).toList(),
            ),
          ),

          Spacer(),

          // Narx va Add to Cart tugmasi
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ 1,190',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
