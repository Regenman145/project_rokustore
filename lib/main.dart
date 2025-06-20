import 'package:flutter/material.dart';
import 'package:project_sepatu/ui/bottomnav.dart' ;// Correct import path for BottomNavScreen
import 'package:project_sepatu/ui/transaction_page.dart';
import 'ui/login.dart';
import 'ui/register.dart';
import 'ui/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi Halaman',
      debugShowCheckedModeBanner: false,
      home: const BottomNav(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu Utama")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: const Text("Login Screen"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()));
              },
              child: const Text("Dashboard"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()));
              },
              child: const Text("Register"),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
