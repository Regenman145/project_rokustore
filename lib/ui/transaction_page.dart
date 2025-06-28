import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});  // Tambahkan constructor tanpa parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
        backgroundColor: const Color(0xFF39E76A),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Contoh item transaksi
          ListTile(
            title: Text("Sepatu A"),
            subtitle: Text("\$100.00"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Navigasi ke detail transaksi
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => TransactionDetailPage(
                  name: "Sepatu A",
                  price: 100.00,
                  size: "42",
                  color: Colors.red,
                ),
              ));
            },
          ),
          // Tambahkan lebih banyak item transaksi di sini
        ],
      ),
    );
  }
}

// Class untuk detail transaksi (dipindahkan dari TransactionPage sebelumnya)
class TransactionDetailPage extends StatelessWidget {
  final String name;
  final double price;
  final String size;
  final Color color;

  const TransactionDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction Details"),
        backgroundColor: const Color(0xFF39E76A),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transaction Summary",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "Item: $name",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Price: $price",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Size: $size",
              style: const TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                const Text(
                  "Color: ",
                  style: TextStyle(fontSize: 18),
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: color,
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to Shop"),
            ),
          ],
        ),
      ),
    );
  }
}