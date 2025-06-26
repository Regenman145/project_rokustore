import 'package:flutter/material.dart';
import 'package:project_sepatu/ui/itempage.dart';
import 'package:project_sepatu/ui/login.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      'ROKUSTORE',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/shoes1.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text("40% OFF",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Mengatur scroll ke arah horizontal
                  child: Row(
                    children: [
                      ProductCard(
                        name: 'Nike Shoes\nSneakers',
                        price: '\$189.99',
                        imagePath: 'assets/shoes1.png',
                        bgColor: const Color(0xFFB2F5EA),
                        width: 150,
                        height: 200,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ShoeCard()));
                        },
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ShoeCard()));
                        },
                      ),

                      const SizedBox(width: 16),

                      ProductCard(
                        name: 'Nike Kyrie 1\nLetterman',
                        price: '\$160.99',
                        imagePath: 'assets/shoes2.png',
                        bgColor: const Color(0xFF90CDF4),
                        width: 150,
                        height: 200,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ShoeCard()));
                        },
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ShoeCard()));
                        },
                      ),
                      const SizedBox(width: 16),

                      ProductCard(
                        name: 'Nike Kyrie 1\nLetterman',
                        price: '\$160.99',
                        imagePath: 'assets/shoes3.png',
                        bgColor: const Color(0xFF90CDF4),
                        width: 150,
                        height: 200,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ShoeCard()));
                        },
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ShoeCard()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
  final VoidCallback onTap; // Callback untuk navigasi

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.bgColor,
    required this.onTap, // Tambahkan parameter onTap
    this.width = 150, // Default lebar kartu
    this.height = 200,
    required Null Function() onPressed, // Default tinggi kartu
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Menambahkan navigasi saat kartu diklik
      child: Container(
        width: width, // Menggunakan lebar yang diberikan
        height: height, // Menggunakan tinggi yang diberikan
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

class ItemPage extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

  const ItemPage({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
