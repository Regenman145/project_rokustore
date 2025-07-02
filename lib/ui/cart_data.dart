import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';

class CartData {
  static final ValueNotifier<List<CartItem>> cartItems = ValueNotifier([]);

  static Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cart_items');
    if (cartData != null) {
      cartItems.value = (json.decode(cartData) as List)
          .map((item) => CartItem.fromJson(item))
          .toList();
    }
  }

  static Future<void> addToCart(CartItem item) async {
    final prefs = await SharedPreferences.getInstance();
    cartItems.value = [...cartItems.value, item];
    await prefs.setString(
      'cart_items',
      json.encode(cartItems.value.map((e) => e.toJson()).toList()),
    );
  }
}