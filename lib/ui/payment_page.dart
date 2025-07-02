// Halaman Metode Pembayaran
import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue, title: const Text('Metode Pembayaran')),
      body: const Center(
          child: Text('Di sini user bisa menambahkan metode pembayaran')),
    );
  }
}