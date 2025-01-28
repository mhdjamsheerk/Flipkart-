import 'package:flutter/material.dart';
import '../Cartpage/cart-page.dart'; 
import '../Grocery/grocery.dart';   // Ensure correct import paths

class CartBar extends StatefulWidget {
  const CartBar({super.key});

  @override
  State<CartBar> createState() => _CartBarState();
}

class _CartBarState extends State<CartBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            
          ),
          centerTitle: false, 
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            indicatorWeight: 4,         
            labelColor: Colors.blue,    
            unselectedLabelColor: Color.fromARGB(179, 210, 198, 198),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ), 
            tabs: [
              Tab(text: 'Flipkart'),
              Tab(text: 'Grocery'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Cart(),    
            Grocery(), 
          ],
        ),
      ),
    );
  }
}
