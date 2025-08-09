// cart_model.dart
import 'package:ecommcere_clean_app/features/cart/data/models/sub_models/product_cart_sub_model.dart';

import '../../domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required int id,
    required int userId,
    required DateTime date,
    required List<CartProductModel> products,
  }) : super(id: id, userId: userId, date: date, products: products);

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      date: DateTime.parse(json['date'] as String),
      products: (json['products'] as List)
          .map((p) => CartProductModel.fromJson(p))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "date": date.toIso8601String(),
      "products": products
          .map((p) => (p as CartProductModel).toJson())
          .toList(),
    };
  }
}
