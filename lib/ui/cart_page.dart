import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/cart_item.dart';
import '../ui/cart_data.dart';
// Import transaction data if needed

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> _cartItems = [];

  void _updateCart() {
    setState(() {
      _cartItems = CartData.cartItems.value;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCartItems();
    CartData.cartItems.addListener(_updateCart);
  }

  @override
  void dispose() {
    CartData.cartItems.removeListener(_updateCart);
    super.dispose();
  }

  Future<void> _loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cart_items');
    
    if (cartData != null) {
      final List<dynamic> jsonList = json.decode(cartData);
      setState(() {
        _cartItems = jsonList.map((item) => CartItem.fromJson(item)).toList();
        CartData.cartItems.value = _cartItems;
      });
    }
  }

  Future<void> _buyItems() async {
    if (_cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Keranjang kosong, tidak bisa membeli')),
      );
      return;
    }

    // Implement your purchase logic here
    // For example, you might want to:
    // 1. Add to transaction history
    // 2. Clear the cart
    // 3. Show success message

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart_items');
    CartData.cartItems.value = [];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Berhasil membeli ${_cartItems.length} item')),
    );

    setState(() {
      _cartItems = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: Column(
        children: [
          Expanded(
            child: _cartItems.isEmpty
                ? const Center(child: Text('Keranjang kosong'))
                : ListView.builder(
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return ListTile(
                        title: Text(item.productName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ukuran: ${item.size}'),
                            Text('Jumlah: ${item.quantity}'),
                          ],
                        ),
                        trailing: Text(
                          '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
          ),
          if (_cartItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _buyItems,
                      child: const Text(
                        'Beli Sekarang',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}