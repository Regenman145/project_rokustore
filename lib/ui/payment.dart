import 'package:flutter/material.dart';
import 'payment_confirmation_page.dart'; // <-- Import baru

class PaymentPage extends StatelessWidget {
  final String itemName;
  final double price;

  PaymentPage({required this.itemName, required this.price});

  final List<Map<String, dynamic>> paymentMethods = [
    {"name": "LinkAja", "color": Colors.red},
    {"name": "GoPay", "color": Colors.blue},
    {"name": "OVO", "color": Colors.purple},
    {"name": "ShopeePay", "color": Colors.orange},
    {"name": "Isaku", "color": Colors.cyan},
    {"name": "PosPay", "color": Colors.deepOrange},
    {"name": "Dana", "color": Colors.lightBlue},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pilih Metode Pembayaran")),
      body: ListView.builder(
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          var method = paymentMethods[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: method["color"],
            child: ListTile(
              title: Text(
                method["name"],
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentConfirmationPage(
                      itemName: itemName,
                      price: price,
                      paymentMethod: method["name"],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
