import 'package:flipkart_project/Order/Orders.dart';
import 'package:flipkart_project/SignUp&LogIn/Sign_In.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: const Text(
                    'Hey! IRFAN HABEEB',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                _buildSuperCoin(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExploreSection(),
            const Divider(thickness: 1, color: Colors.black12),
            _buildTopOptions(context),
            const Divider(thickness: 10, color: Colors.black12),
            _buildCreditOptions(),
            const Divider(thickness: 10, color: Colors.black12),
            _buildRewardsSection(),
            const Divider(thickness: 10, color: Colors.black12),
            _buildAccountSettings(),
            const Divider(thickness: 10, color: Colors.black12),
            _buildMyActivity(),
            const Divider(thickness: 10, color: Colors.black12),
            _buildFeedbackSection(),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSuperCoin() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 60,
        height: 23,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/supercoin.jpg',
              height: 20,
            ),
            const Text(
              '771',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          children: [
            const Text(
              'Explore',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            const Gap(10),
            Image.asset(
              'assets/flipplus.jpg',
              height: 30,
            ),
            const Gap(3),
            const Icon(Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildTopOptions(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTopOption(
              icon: Icons.business,
              label: 'Orders',
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => MyOrder()));
              },
            ),
            _buildTopOption(icon: Icons.favorite_outline_outlined, label: 'Wishlist'),
          ],
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTopOption(icon: Icons.card_giftcard, label: 'Coupons'),
            _buildTopOption(icon: Icons.headset_mic, label: 'Help Center'),
          ],
        ),
      ],
    );
  }

  Widget _buildTopOption({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 37,
            width: 160,
            decoration: BoxDecoration(
              border: Border.all(color:const Color.fromARGB(95, 143, 129, 129))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(icon, color: Colors.blue, size: 23),

                    const Gap(8),
          Text(label, style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            
          ),
        
        ],
      ),
    );
  }

  Widget _buildCreditOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: const Text(
              'Credit Option',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ),
          const Gap(10),
          _buildCreditTile(
            icon: Icons.paid,
            title: 'Flipkart Pay Later',
            subtitle: 'Flipkart Axis Bank Credit Card',
          ),
          _buildCreditTile(
            icon: Icons.credit_card,
            title: 'Flipkart Axis Bank Credit Card',
          ),
        ],
      ),
    );
  }

  Widget _buildCreditTile({
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(fontSize: 12))
          : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
    );
  }

  Widget _buildRewardsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/levelup2.jpg.png',
              height: 150,
              width: 350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: const Divider(
              thickness: 4,
              color: Colors.green,
              endIndent: 100,
            ),
          ),
          const ListTile(
            title: Padding(
              padding: EdgeInsets.only(top: 2, right: 15),
              child: Text(
                'Level Up and Win rewards Worth Rs.10000',
                style: TextStyle(fontSize: 12),
              ),
            ),
            subtitle: Text(
              'Only 1 more task to complete this level',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings() {
    return _buildSection(
      title: 'Account Settings',
      items: [
        _buildAccountTile('Flipkart Plus', Icons.star),
        _buildAccountTile('Edit Profile', Icons.person),
        _buildAccountTile('Select Language', Icons.language),
        _buildAccountTile('Notification Settings', Icons.edit_notifications),
      ],
    );
  }

  Widget _buildMyActivity() {
    return _buildSection(
      title: 'My Activity',
      items: [
        _buildAccountTile('Reviews', Icons.edit_document),
        _buildAccountTile('Questions & Answers', Icons.forum),
      ],
    );
  }

  Widget _buildFeedbackSection() {
    return _buildSection(
      title: 'Feedback & Information',
      items: [
        _buildAccountTile('Flipkart Creator Studio', Icons.sim_card),
        _buildAccountTile('Help Center', Icons.help),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const Gap(10),
          ...items,
        ],
      ),
    );
  }

  Widget _buildAccountTile(String text, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      color: const Color.fromARGB(255, 205, 203, 203),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.blue),
        ),
        child: const Text('Log Out', style: TextStyle(color: Colors.blue)),
      ),
    );
  }
}
