import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  const MyBottomNavbar({super.key, required this.onTabChange});
  final void Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabBackgroundColor: Colors.grey.shade100,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBorderRadius: 16,
        gap: 8,
        onTabChange: onTabChange,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
