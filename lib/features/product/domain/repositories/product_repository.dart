import 'package:dartz/dartz.dart';
import 'package:ecommcere_clean_app/core/errors/failure.dart';
import 'package:ecommcere_clean_app/features/product/domain/entities/product.dart';
import 'package:ecommcere_clean_app/features/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, Product>> getSingleProduct(int id);
}
