import 'package:dartz/dartz.dart';
import 'package:ecommcere_clean_app/core/errors/failure.dart';
import 'package:ecommcere_clean_app/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getCartProducts();
  //////////////////////////////////////
  AddProductToCart(int id);
}
