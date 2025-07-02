// Halaman Info Akun
import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.blue, title: const Text('Info Akun')),
      body: const Center(child: Text('Halaman Info Akun')),
    );
  }
}

