import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.orange,
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: const Text('Stock Page', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Container(
            color: Colors.orange.shade100,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Item #${index + 1}'),
                    subtitle: Text('Stock: ${(index + 1) * 10} units'),
                    trailing: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
