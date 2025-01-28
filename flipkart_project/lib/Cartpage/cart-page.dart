import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDeliveryAddress(),
                  const Gap(14),
                  const Divider(thickness: 1),
                  const Gap(12),
                  _buildCartItem(
                    image: 'assets/jacket.jpg',
                    title: 'LETECH Full Sleeve Solid Men Jacket',
                    subtitle: 'Size: Small',
                    discount: '61% off',
                    originalPrice: '₹3,123',
                    discountedPrice: '₹1,200',
                    deliveryDate: 'Delivery by Thu Mar 9',
                  ),
                  const Gap(14),
                  const Divider(thickness: 1),
                  const Gap(12),
                  _buildCartItem(
                    image: 'assets/wallsticker.jpg',
                    title: 'WALLSTICK 72cm Life quotes',
                    subtitle: 'Pack of 1',
                    discount: '75% off',
                    originalPrice: '₹699',
                    discountedPrice: '₹150',
                    deliveryDate: 'Delivery by Mon Apr 29',
                  ),
                  const Gap(14),
                  const Divider(thickness: 1),
                  const Gap(12),
                  _buildCartItem(
                    image: 'assets/forumlaw.jpg',
                    title: 'FORUM LOW Shoes (Light Blue)',
                    subtitle: 'Size: All Size',
                    discount: '55% off',
                    originalPrice: '₹10,999',
                    discountedPrice: '₹8,999',
                    deliveryDate: 'Delivery by Tue Apr 23',
                  ),
                  const Gap(14),
                  const Divider(thickness: 1),
                  const Gap(12),
                  _buildCartItem(
                    image: 'assets/real me.jpg',
                    title: 'REALME Ultrs Phone (Light Blue)',
                    subtitle: 'Size: All Size',
                    discount: '65% off',
                    originalPrice: '₹10,999',
                    discountedPrice: '₹14,999',
                    deliveryDate: 'Delivery by Tue Apr 23',
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Row(
                    children: [
                      Text(
                       
                        'Total: ₹25,348',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          
                        ),
                        
                      ),
                      Gap(10),
                      Icon(Icons.info_outline_rounded,size: 20,color: Colors.grey,)
                    ],
                  ),
                  Text(
                    'Inclusive of all taxes',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                
                onPressed: () {
               
                 
                },
                style: ElevatedButton.styleFrom(backgroundColor: (Colors.amber),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 16,color: Colors.black ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildDeliveryAddress() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: const Text(
          'Deliver to: JAMSHEER, 673885',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          'Kollarakkal, Narikkuni',
          style: TextStyle(fontSize: 14),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(color: Colors.blue),
          ),
          onPressed: () {},
          child: const Text(
            'Change',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required String image,
    required String title,
    required String subtitle,
    required String discount,
    required String originalPrice,
    required String discountedPrice,
    required String deliveryDate,
  }) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const Gap(4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     
                     const Gap(5),
                     const Row(
                       children: [
                         Icon(Icons.star, color: Colors.green,size: 20,),
                         Icon(Icons.star, color: Colors.green,size: 20),
                         Icon(Icons.star, color: Colors.green,size: 20),
                         Icon(Icons.star_half, color: Colors.green,size: 20),
                         Icon(Icons.star, color: Colors.black12,size: 20),
                       ],
                     ),
                   ],
                 ),
              const Gap(8),
              Row(
                children: [
                  Text(
                    discountedPrice,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    originalPrice,
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    discount,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              
              const Gap(8),
              Text(
                deliveryDate,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
      
            ],
          ),
        ),
      ],
    );
  }
}
