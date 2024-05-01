class ProductDataModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final int? quantity;
  final String imageUrl;

  ProductDataModel(
      {required this.category,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.quantity});
}
