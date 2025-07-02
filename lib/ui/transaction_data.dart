// models/transaction_item.dart
class TransactionItem {
  final String name;
  final double price;
  final String size;
  final int quantity;
  final String color; // Changed from Color to String for serialization
  final DateTime date;

  TransactionItem({
    required this.name,
    required this.price,
    required this.size,
    required this.quantity,
    required this.color,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'size': size,
    'quantity': quantity,
    'color': color,
    'date': date.toIso8601String(),
  };

  factory TransactionItem.fromJson(Map<String, dynamic> json) => TransactionItem(
    name: json['name'],
    price: json['price'],
    size: json['size'],
    quantity: json['quantity'],
    color: json['color'],
    date: DateTime.parse(json['date']),
  );
}