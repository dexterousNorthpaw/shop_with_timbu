import 'package:flutter/material.dart';
import 'package:shop_with_timbu/screens/home_products_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  List<Widget> widgetOptions = [const ProductsScreen()];

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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
      //  Column(
      //   children: [],
      // ),
    );
  }
}
