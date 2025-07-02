import 'package:flutter/material.dart';
import 'package:project_sepatu/models/cart_item.dart';
import 'package:project_sepatu/ui/bottomnav.dart';
import 'package:project_sepatu/ui/cart_data.dart';
import 'package:project_sepatu/ui/transaction_data.dart';
import 'package:project_sepatu/ui/transaction_page.dart';

class ShoeCard extends StatefulWidget {
  const ShoeCard({super.key});

  @override
  _ShoeCardState createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  int selectedSizeIndex = 2;
  int selectedColorIndex = 0;

  final List<double> sizes = [38.5, 40.5, 41.5, 42.5];
  final List<Color> colors = [Colors.blue, Colors.red, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Details"),
        backgroundColor: const Color(0xFF39E76A),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFF39E76A),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar sepatu
            Center(
              child: Image.asset('assets/shoes1.png', height: 240),
            ),
            const SizedBox(height: 16),

            // Label PRICE dan COLORS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "PRICE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "COLORS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Harga dan pilihan warna
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$189.99",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(colors.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColorIndex = index;
                          });
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: colors[index],
                          child: selectedColorIndex == index
                              ? const Icon(Icons.check,
                                  size: 12, color: Colors.black)
                              : null,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Pilihan ukuran
            const Text(
              "SIZE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(sizes.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSizeIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedSizeIndex == index
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      sizes[index].toString(),
                      style: TextStyle(
                        color: selectedSizeIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),

            // Footer pesan
            const Center(
              child: Text(
                "Thank you for shopping with us!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol "Buy" dan "Add Item"
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
// In the "Add Item" button's onPressed handler, replace the current implementation with:

                    onPressed: () {
                      // Create a CartItem
                      final newItem = CartItem(
                        productName: 'Nike Shoes Sneakers',
                        price: 189.99,
                        size: sizes[selectedSizeIndex].toString(),
                        quantity: 1,
                      );

                      // Add to cart
                      CartData.addToCart(newItem);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item added to cart!")),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BottomNav(),
                        ),
                      );
                    },
                    child: const Text("Buy"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    // In the onPressed handler for "Add Item" button:
                    onPressed: () {
                      // Create a CartItem instead of TransactionItem
                      CartData.addToCart(
                        CartItem(
                          productName: 'Nike Shoes Sneakers',
                          price: 189.99,
                          size: sizes[selectedSizeIndex].toString(),
                          quantity: 1, // Default quantity
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item added to cart!")),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BottomNav(),
                        ),
                      );
                    },
                    child: const Text("Add Item"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
