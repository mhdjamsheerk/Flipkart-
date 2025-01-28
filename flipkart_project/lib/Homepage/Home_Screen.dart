import 'package:carousel_slider/carousel_slider.dart';

import 'package:flipkart_project/Grocery/grocery.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> carouselImages = [
    'assets/flipkart2.jpg',
    'assets/flipkart1.jpg',
    'assets/flipkart3.jpg',
  ];

  final List<Map<String, dynamic>> circleAvatarData = [
    {'image': 'assets/credit_prev.jpg', 'name': 'Credit'},
    {'image': 'assets/coupens_prev.jpg', 'name': 'Coupons'},
    {'image': 'assets/group_buy2.jpg', 'name': 'Group Buy'},
    {'image': 'assets/plus.jpg', 'name': 'Plus'},
    {'image': 'assets/supercoin.jpg', 'name': 'SuperCoin'},
  ];

  final List<Map<String, dynamic>> productData = [
    {
      'image': 'assets/laptop_new.jpg',
      'name': 'Laptop Deals\nFrom Rs 13,990',
    },
    {
      'image': 'assets/tea.jpg',
      'name': 'Extra 75 off\nSale is Live',
    },
    {
      'image': 'assets/smart_watch.jpg',
      'name': 'Bt Calling 1.83\nSale Price 1,499',
    },
  ];

  final List<String> recentlyViewedImages = [
    'assets/mushhh.jpg',
    'assets/amulPowd-removebg.jpg',
    'assets/tair-removebg-preview.jpg',
  ];

  static const List<Widget> _bottomNavItems = [
    Icon(Icons.home, color: Colors.blue),
    Icon(Icons.search, color: Colors.grey),
    Icon(Icons.shopping_cart, color: Colors.grey),
    Icon(Icons.person, color: Colors.grey),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                _buildToggleButtons(),//custom widgets
                const Gap(10),
                _buildSearchBar(),
                const Gap(10),
                _buildCarouselSlider(),
                const Gap(10),
                _buildCircleAvatars(),
                const Gap(10),
                _buildProductCards(),
                const Gap(10),
                _buildRecentlyViewedStores(),
              ],
            ),
          ),
        ),
      ),
      
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildToggleButton(
          image: 'assets/flipkart-logo-transparent-png.png',
          text: 'Flipkart', //create toogle button
          isSelected: _selectedIndex == 0,
          onTap: () => _onItemTapped(0),
        ),
        _buildToggleButton(
          image: 'assets/flipkart-logo-Grocery.jpg',
          text: 'Grocery',
          isSelected: _selectedIndex == 1,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Grocery()));
          },
        ),
      ],
    );
  }

  Widget _buildToggleButton({
    required String image,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white30,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        width: 175,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 30),
            const Gap(5),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: isSelected ? Colors.white : Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/brandMall,jpg.png', height: 30),
        const Gap(10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: 0.1),
              ),
              filled: true,
              fillColor: const Color(0xfff5f7fa),
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search for products',
              contentPadding: const EdgeInsets.all(5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      items: carouselImages.map((imagePath) {
        return Image.asset(imagePath, fit: BoxFit.fill);
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        height: 200,
      ),
    );
  }

  Widget _buildCircleAvatars() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: circleAvatarData.map((data) {
          return Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: const Color(0xfff0f5ff),
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(data['image']),
                    ),
                  ),
                ),
                const Gap(5),
                Text(
                  data['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 11),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: productData.map((data) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 200,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      gradient: const LinearGradient(
                        colors: [Color(0xfff6a0dc), Color(0xff53abf0)],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffe7ecff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(data['image']),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 160,
                    decoration: const BoxDecoration(
                      color: Color(0xfff1f3ff),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        data['name'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecentlyViewedStores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recently Viewed Stores',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: recentlyViewedImages.map((imagePath) {
              return Container(
                width: 110,
                height: 110,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
