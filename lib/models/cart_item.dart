class CartItem {
  final String productName;
  final double price;
  final String size;
  final int quantity;

  CartItem({
    required this.productName,
    required this.price,
    required this.size,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    'productName': productName,
    'price': price,
    'size': size,
    'quantity': quantity,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    productName: json['productName'],
    price: json['price'],
    size: json['size'],
    quantity: json['quantity'],
  );
}