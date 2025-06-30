import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_sepatu/ui/bottomnav.dart';
import 'package:project_sepatu/ui/cart_data.dart';
import 'package:project_sepatu/ui/itempage.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
final  PageController _pageController = PageController();

  int _currentPage = 0;
  
  final List<String> sliderImages = [
    'assets/shoes1.png',
    'assets/shoes2.png',
    'assets/shoes3.png',
  ];

Timer? _timer;

@override
void initState() {
  super.initState();
  _startAutoSlide();
}

void _startAutoSlide() {
  _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
}

@override
void dispose() {
  _timer?.cancel();
  _pageController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        actions: [
          ValueListenableBuilder(
            valueListenable: CartData.cartItems,
            builder: (context, cart, _) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const BottomNav(currentIndex: 1)),
                      );
                    },
                  ),
                  if (cart.isNotEmpty)
                    Positioned(
                      right: 6,
                      top: 20,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cart?.length}',
                          style: const TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
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
            //Corousel Slider
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: sliderImages.length,
                onPageChanged: (index){
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      sliderImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      ),
                  );
                },),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                sliderImages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
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

extension on Object? {
  get length => null;
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
