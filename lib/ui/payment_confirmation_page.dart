import 'package:flutter/material.dart';
import 'bottomnav.dart';

class PaymentConfirmationPage extends StatelessWidget {
  final String itemName;
  final double price;
  final String paymentMethod;

  const PaymentConfirmationPage({
    super.key,
    required this.itemName,
    required this.price,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konfirmasi Pembayaran"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Item: $itemName", style: TextStyle(fontSize: 18)),
            Text("Harga: \$${price.toStringAsFixed(2)}", style: TextStyle(fontSize: 18)),
            Text("Metode Pembayaran: $paymentMethod", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                // Setelah bayar, kembali ke home
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const BottomNav(currentIndex: 0)),
                  (route) => false,
                );
              },
              child: const Text("Bayar Sekarang"),
            ),
          ],
        ),
      ),
    );
  }
}
