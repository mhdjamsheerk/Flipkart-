import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Gap(15),
              _buildSearchAndFilterRow(),
              const Gap(10),
              const Divider(thickness: 2),
              const Gap(10),

              
              _buildOrderList(),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _buildSearchAndFilterRow() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search your order here..',
                hintStyle: const TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
        const Gap(10),
        InkWell(
          onTap: () {
            // Add filter functionality
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.filter_list, color: Colors.black, size: 30),
                Gap(5),
                Text(
                  'Filters',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderList() {
    final List<Map<String, dynamic>> orders = [
      {
        'image': 'assets/Apple_iphone.jpg',
        'title': 'Delivered on Dec 29, 2024',
        'subtitle': 'iPhone 15 (Silver)',
      },
      {
        'image': 'assets/Discovery_Plus.jpg',
        'title': 'Delivered on Dec 26, 2022',
        'subtitle': 'Free Discovery+ 25% off on annual subscription',
      },
      {
        'image': 'assets/Apple_iphone.jpg',
        'title': 'Canceled on Dec 29, 2024',
        'subtitle': 'iPhone 15 (Silver)',
      },
      {
        'image': 'assets/Discovery_Plus.jpg',
        'title': 'Canceled on Dec 26, 2022',
        'subtitle': 'Free Discovery+ 25% off on annual subscription',
      },
      {
        'image': 'assets/oppo.jpg',
        'title': 'Delivered on Dec 16, 2022',
        'subtitle': 'Oppo F19 Pro+ 5G (Space Black)',
      },
      {
        'image': 'assets/coinDcx.jpg',
        'title': 'Delivered on Dec 16, 2022',
        'subtitle': 'Free CoinDcx +35% off on annual subscription',
      },
    ];

    return Column(
      children: orders.map((order) {
        return Column(
          children: [
            _buildOrderTile(
              imagePath: order['image'],
              title: order['title'],
              subtitle: order['subtitle'],
            ),
            const Gap(10),
            if (order != orders.last) const Divider(),
            const Gap(10),
          ],
        );
      }).toList(),
    );
  }

 
  Widget _buildOrderTile({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error); // Fallback for missing images
          },
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}