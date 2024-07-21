import 'package:flutter/material.dart';
import 'package:shop_with_timbu/screens/home_products_screen.dart';
import 'package:shop_with_timbu/screens/order_history.dart';
import 'package:shop_with_timbu/screens/wishlist_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  List<Widget> widgetOptions = [
    const ProductsScreen(),
    WishListScreen(),
    Container(),
    OrderHistoryScreen(),
  ];

  void _onNavItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onNavItemTap,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Change to your desired color
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: "Wishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: "Order History"),
        ],
      ),
      //  Column(
      //   children: [],
      // ),
    );
  }
}
