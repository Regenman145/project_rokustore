import 'package:flutter/material.dart';
import 'package:project_sepatu/ui/transaction_data.dart';

class CartData {
  static final ValueNotifier<List<TransactionItem>> cartItems =
      ValueNotifier<List<TransactionItem>>([]);

  static void addToCart(TransactionItem item) {
    cartItems.value = [...cartItems.value, item];
  }

  static void clearCart() {
    cartItems.value = [];
  }
}
