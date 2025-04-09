import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/home.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/heart.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/cart.svg'),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/user.svg'),
          label: '',
        ),
      ],
    );
  }
}
