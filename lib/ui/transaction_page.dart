import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:project_sepatu/models/transaction_item.dart';
import 'package:project_sepatu/ui/transaction_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final List<TransactionItem> _transactions = [];

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final transactionData = prefs.getString('transactions');
    
    if (transactionData != null) {
      final List<dynamic> jsonList = json.decode(transactionData);
      setState(() {
        _transactions.clear();
        _transactions.addAll(
          jsonList.map((item) => TransactionItem.fromJson(item)).toList()
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: _transactions.isEmpty
          ? const Center(child: Text('No transactions yet'))
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                return ListTile(
                  title: Text(transaction.name),
                  subtitle: Text(
                    '${transaction.quantity}x • ${transaction.size} • \$${transaction.price.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    '\$${(transaction.price * transaction.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
    );
  }
}

// TransactionData class for managing transactions
class TransactionData {
  static Future<void> addTransaction(TransactionItem item) async {
    final prefs = await SharedPreferences.getInstance();
    final transactionData = prefs.getString('transactions') ?? '[]';
    final List<dynamic> existing = json.decode(transactionData);
    existing.add(item.toJson());
    await prefs.setString('transactions', json.encode(existing));
  }

  static Future<void> loadTransactions() async {}
}