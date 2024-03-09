import 'package:flutter/material.dart';
import 'package:minimal_shop/components/bottom_navbar.dart';
import 'package:minimal_shop/pages/cart_page.dart';
import 'package:minimal_shop/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  final _pages = const [ShopPage(), CartPage()];

  void _onTapBottomNavbar(int val) {
    setState(() {
      _selectedIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[700],
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(),
                    child: Image.asset(
                      'assets/nike-png.png',
                      color: Colors.white,
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavbar(
        onTabChange: (val) => _onTapBottomNavbar(val),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
