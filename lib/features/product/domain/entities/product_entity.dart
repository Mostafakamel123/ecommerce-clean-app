import 'package:ecommcere_clean_app/features/product/domain/entities/sub_entities/ratinig_entity.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final String category;
  final String image;
  final RatinigEntity rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });
}
