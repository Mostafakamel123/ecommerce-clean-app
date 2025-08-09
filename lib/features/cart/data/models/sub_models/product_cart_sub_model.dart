import 'package:ecommcere_clean_app/features/cart/domain/entities/sub_entites/cart_product_sub_entity.dart';

class CartProductModel extends CartProductEntity {
  const CartProductModel({required int productId, required int quantity})
    : super(productId: productId, quantity: quantity);

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {"productId": productId, "quantity": quantity};
  }
}
