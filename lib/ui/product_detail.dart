import 'package:flutter/material.dart';
import 'package:project_sepatu/ui/cart_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/cart_item.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final double price;

  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? _selectedSize;
  int _quantity = 1;

  void _addToCart() async {
    if (_selectedSize == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a size first')),
      );
      return;
    }

    final newItem = CartItem(
      productName: widget.productName,
      price: widget.price,
      size: _selectedSize!,
      quantity: _quantity,
    );

    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cart_items') ?? '[]';
    final List<dynamic> cartItems = List.from(json.decode(cartData));
    cartItems.add(newItem.toJson());
    
    await prefs.setString('cart_items', json.encode(cartItems));
    CartData.cartItems.value = [...CartData.cartItems.value, newItem];

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.productName} added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.productName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PRICE',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '\$${widget.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            const Text('COLORS'),
            const SizedBox(height: 16),
            const Text('SIZE'),
            Wrap(
              spacing: 8,
              children: ['38.5', '40.5', '41.5', '42.5']
                  .map((size) => ChoiceChip(
                        label: Text(size),
                        selected: _selectedSize == size,
                        onSelected: (selected) {
                          setState(() {
                            _selectedSize = selected ? size : null;
                          });
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                      });
                    }
                  },
                ),
                Text('$_quantity'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _addToCart,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}