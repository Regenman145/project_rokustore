import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_sepatu/ui/itempage.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome To',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'ROKUSTORE',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'New Sneakers 2025',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
              ),
              items: [
                'assets/shoes1.png',
                'assets/shoes2.png',
                'assets/shoes3.png',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Container(
            //   height: 160,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(16),
            //     image: const DecorationImage(
            //       image: AssetImage('assets/shoes1.png'),
            //       fit: BoxFit.fitHeight,
            //     ),
            //   ),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: Container(
            //         color: Colors.red,
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //         child: const Text("40% OFF",
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 24),
            const Text(
              'Our Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                    name: 'Nike Shoes\nSneakers',
                    price: '\$189.99',
                    imagePath: 'assets/shoes1.png',
                    bgColor: const Color(0xFFB2F5EA),
                    width: 150,
                    height: 200,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ShoeCard()),
                      );
                    },
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  ProductCard(
                    name: 'Nike Kyrie 1\nLetterman',
                    price: '\$160.99',
                    imagePath: 'assets/shoes2.png',
                    bgColor: const Color(0xFF90CDF4),
                    width: 150,
                    height: 200,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ShoeCard()),
                      );
                    },
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  ProductCard(
                    name: 'Nike Kyrie 1\nLetterman',
                    price: '\$160.99',
                    imagePath: 'assets/shoes3.png',
                    bgColor: const Color(0xFF90CDF4),
                    width: 150,
                    height: 200,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ShoeCard()),
                      );
                    },
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onTap;
  final VoidCallback onPressed;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.bgColor,
    required this.onTap,
    required this.onPressed,
    this.width = 150,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(imagePath),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
