import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/store_app_bar.dart';

class SearchPageView extends StatelessWidget {
  final bool isEmpty;

  const SearchPageView({super.key, required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Search"),
      body: isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/search.svg"),
            const SizedBox(height: 16),
            const Text(
              "No Results Found!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Try a similar word or something\nmore general.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )
          : ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for clothes...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),

          _buildProductItem("Regular Fit Slogan", "\$1,190", "assets/images/t-shirt.png"),
          _buildProductItem("Regular Fit Polo", "\$1,000", "assets/images/t-shirt.png", discount: "-52%"),
          _buildProductItem("Regular Fit Black", "\$1,690", "assets/images/t-shirt.png"),
          _buildProductItem("Regular Fit V-Neck", "\$1,290", "assets/images/t-shirt.png"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home.svg", height: 24),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/search.svg", height: 24),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/cart.svg", height: 24),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/saved.svg", height: 24),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/account.svg"),
            label: "Account",
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String title, String price, String imagePath, {String? discount}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Image.asset(imagePath, width: 60, height: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(price, style: const TextStyle(color: Colors.grey)),
                    if (discount != null) ...[
                      const SizedBox(width: 8),
                      Text(discount, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ]
                  ],
                )
              ],
            ),
          ),
          const Icon(Icons.open_in_new, size: 20),
        ],
      ),
    );
  }
}
