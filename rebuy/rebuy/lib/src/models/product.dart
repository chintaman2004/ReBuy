class Product {
  final String id;
  final String title;
  final String image;
  final double price;
  final String description;

  Product({required this.id, required this.title, required this.image, required this.price, required this.description});

  factory Product.fromMap(Map<String, dynamic> m) => Product(
    id: m['_id']?.toString() ?? m['id']?.toString() ?? '',
    title: m['title'] ?? '',
    image: m['image'] ?? '',
    price: (m['price'] is num) ? (m['price'] as num).toDouble() : double.tryParse('${m['price']}') ?? 0.0,
    description: m['description'] ?? '',
  );

  Map<String, dynamic> toMap() => {
    'title': title,
    'image': image,
    'price': price,
    'description': description,
  };
}
