class ProductModel {
  final String id;
  final String title;
  final String image;
   num? price;
  final String? category;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    this.price,
    this.category,
  });
}
