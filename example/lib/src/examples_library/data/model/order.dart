class Order {
  final String id;
  final DateTime createdAt;
  final double totalPrice;

  const Order({
    required this.id,
    required this.createdAt,
    required this.totalPrice,
  });
}
