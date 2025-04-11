import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/common/store_app_bar.dart';

class SavedItemView extends StatelessWidget {
  const SavedItemView({super.key});

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(title: "Saved Items"),
      body: isEmpty ? _buildEmptyState() : _buildGrid(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/heart.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/profile.svg"),
            label: "",
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/heart_empty.svg',
            width: 64,
            height: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 20),
          const Text(
            "No Saved Items",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "You don’t have saved items\nGo to Home and add some.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.7,
        children: List.generate(6, (index) => _buildItemCard()),
      ),
    );
  }

  Widget _buildItemCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/t-shirt.png",
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/heart_filled.svg',
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Regular Fit Slogan",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        const Text(
          "\$1,190",
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }
}
