import 'package:flutter/material.dart';

class TransactionItem {
  final String name;
  final double price;
  final String size;
  final Color color;

  TransactionItem({
    required this.name,
    required this.price,
    required this.size,
    required this.color,
  });
}

class TransactionData {
  static final List<TransactionItem> transactions = [];

  static void addTransaction(TransactionItem item) {
    transactions.add(item);
  }
}
