import 'package:flipkart_project/Account/account.dart';


import 'package:flipkart_project/Cartpage/cart-page.dart';
import 'package:flipkart_project/Categories/categories.dart';
import 'package:flipkart_project/Homepage/Home_Screen.dart';
import 'package:flipkart_project/Notification/notifications.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  final pagesItem = [
    HomeScreen(),
    Categories(),
    Notifications(),
    Account(),

    Cart(),

   
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesItem[currentIndex],//mange the diffrent screen[] and store
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        selectedItemColor: Color(0xff2772ef),
        unselectedItemColor: Colors.black54,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Colors.black54),
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
