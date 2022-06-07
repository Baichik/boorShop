import 'package:boor_shop/screens/account_screen.dart';
import 'package:boor_shop/screens/feeds_screen.dart';
import 'package:boor_shop/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const FeedsScreen(),
    const AccountScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
          color: Color(0xFFFFC600),
          size: 30,
        ),
        selectedItemColor: const Color(0xFFFFC600),
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'San-Francisco',
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Home',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: currentIndex,
      ),
    );
  }
}
