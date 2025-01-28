import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Top Offer',
      'image': 'assets/topOffer.jpg',
    },
    {
      'name': 'Grocery',
      'image': 'assets/grocery_Catg.png',
    },
    {
      'name': 'Mobiles',
      'image': 'assets/phone.png',
    },
    {
      'name': 'Fashion',
      'image': 'assets/fashion.jpg',
    },
    {
      'name': 'Electronics',
      'image': 'assets/electronics.jpg',
    },
    {
      'name': 'Home',
      'image': 'assets/home.jpg',
    },
    {
      'name': 'Personal Care',
      'image': 'assets/beautyCare.jpg',
    },
    {
      'name': 'Appliances',
      'image': 'assets/appliance.jpg',
    },
    {
      'name': 'Toys & Baby',
      'image': 'assets/toy and baby.jpg',
    },
    {
      'name': 'Furniture',
      'image': 'assets/furniture.jpg',
    },
    {
      'name': 'Flight & Hotels',
      'image': 'assets/flight and hotel.jpg',
    },
    {
      'name': 'Insurance',
      'image': 'assets/insurance.jpg',
    },
    {
      'name': 'Sports',
      'image': 'assets/sports.jpg',
    },
    {
      'name': 'Nutrition & More',
      'image': 'assets/nutritions.jpg',
    },
    {
      'name': 'Bike & Car',
      'image': 'assets/bikeandcar.jpg',
    },
    {
      'name': 'Gift Cards',
      'image': 'assets/giftCard1.jpg',
    },
    {
      'name': 'Medicines',
      'image': 'assets/medicine.jpg',
    },
    {
      'name': 'Home Services',
      'image': 'assets/services.jpg',
    },
    {
      'name': 'Self-Back',
      'image': 'assets/sellback.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'All Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Gap(10),
              for (int i = 0; i < categories.length; i += 4)
                _buildCategoryRow(categories.sublist(
                  i,
                  i + 4 > categories.length ? categories.length : i + 4,
                )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryRow(List<Map<String, dynamic>> categoryChunk) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categoryChunk.map((category) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 39,
                      backgroundColor: const Color(0xffc9e7fe),
                      child: ClipOval(
                        child: Image.asset(
                          category['image'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    ),
                    const Gap(5),
                    Text(
                      category['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const Gap(15),
      ],
    );
  }
}
