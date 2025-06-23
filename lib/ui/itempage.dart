import 'package:flutter/material.dart';
import 'package:project_sepatu/ui/dashboard.dart';

class ShoeCard extends StatefulWidget {
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
        title: const Text("Shoe Details"),
        backgroundColor: const Color(0xFF39E76A),
        elevation: 0,
      ),
      body: Container(
        width: 280,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF39E76A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Mengatur agar elemen hanya mengambil ruang yang diperlukan
          children: [
            // Sepatu
            Image.asset('assets/shoes1.png', height: 240),
      
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
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
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
            ),
      
            const SizedBox(height: 24),
      
            // Tulisan di atas footer
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Thank you for shopping with us!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item purchased!")),
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DashboardScreen()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item added to cart!")),
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