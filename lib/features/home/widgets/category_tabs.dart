import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final List<String> tabs = ["All", "Tshirts", "Jeans", "Shoes"];
  final int selectedIndex;
  final Function(int) onTabSelected;

   CategoryTabs({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          bool selected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              width: 92,
              height: 36,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: selected ? Colors.black : Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
