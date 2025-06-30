import 'package:flutter/material.dart';
import 'package:project_sepatu/ui/transaction_data.dart';
import 'package:project_sepatu/ui/bottomnav.dart';

class TransactionPage extends StatelessWidget {
  final String? itemName;
  final double? price;
  final String? paymentMethod;

  const TransactionPage({
    super.key,
    this.itemName,
    this.price,
    this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    final transactions = TransactionData.transactions;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaksi"),
        backgroundColor: const Color(0xFF39E76A),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: transactions.isEmpty
          ? const Center(child: Text("Belum ada transaksi."))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final item = transactions[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("Ukuran: ${item.size} - \$${item.price}"),
                  trailing: CircleAvatar(backgroundColor: item.color),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TransactionDetailPage(
                          name: item.name,
                          price: item.price,
                          size: item.size,
                          color: item.color,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

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
        title: const Text("Detail Transaksi"),
        backgroundColor: const Color(0xFF39E76A),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ringkasan Transaksi", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text("Item: $name", style: TextStyle(fontSize: 18)),
            Text("Harga: \$$price", style: TextStyle(fontSize: 18)),
            Text("Ukuran: $size", style: TextStyle(fontSize: 18)),
            Row(
              children: [
                const Text("Warna: ", style: TextStyle(fontSize: 18)),
                CircleAvatar(radius: 10, backgroundColor: color),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const BottomNav(currentIndex: 0)),
                  (route) => false,
                );
              },
              child: const Text("Kembali ke Beranda"),
            ),
          ],
        ),
      ),
    );
  }
}
