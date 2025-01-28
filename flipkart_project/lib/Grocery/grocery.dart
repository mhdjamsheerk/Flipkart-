import 'package:flipkart_project/Cartpage/cart-page.dart';

import 'package:flutter/material.dart';

class Grocery extends StatelessWidget {
  const Grocery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Cart()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 2.5,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildCategoryItem(index);
              },
            ),
            const SizedBox(height: 10),
            const Text(
              'Popular Items',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildPopularItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(int index) {
    final List<String> categories = [
      'Fruits',
      'Vegetables',
      'Dairy',
      'Bakery',
      'Meat',
      'Beverages',
    ];

    return SizedBox(height: 100,width: 150,
      child: Card(
        
        elevation: 3,
        shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            categories[index],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        
      ),
    );
  }

  Widget _buildPopularItem(int index) {
    final List<Map<String, String>> popularItems = [
      {
        'name': 'Apples',
        'price': '\$2.99/kg',
        'image': 'assets/apple-fruit.jpg'
      },
      {'name': 'Milk', 'price': '\$1.99/liter', 'image': 'assets/milk.jpg'},
      {
        'name': 'Bread',
        'price': '\$3.49/loaf',
        'image': 'assets/bread,jpg.jpg'
      },
      {'name': 'Chicken', 'price': '\$5.99/kg', 'image': 'assets/chicken.jpg'},
           {
        'name': 'Bread',
        'price': '\$3.49/loaf',
        'image': 'assets/bread,jpg.jpg'
      },
    ];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Image.asset(
          popularItems[index]['image']!,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(popularItems[index]['name']!),
        subtitle: Text(popularItems[index]['price']!),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          onPressed: () {
           
          },
        ),
      ),
    );
  }
}
