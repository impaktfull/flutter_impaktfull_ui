class Product {
  final String sku;
  final String name;
  final bool isNewProduct;
  final double price;
  final int stock;

  const Product({
    required this.sku,
    required this.name,
    required this.isNewProduct,
    required this.price,
    required this.stock,
  });
}
