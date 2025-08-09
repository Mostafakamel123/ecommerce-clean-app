import 'package:dartz/dartz.dart';
import 'package:ecommcere_clean_app/core/errors/failure.dart';

import 'package:ecommcere_clean_app/features/product/domain/entities/product_entity.dart';
import 'package:ecommcere_clean_app/features/product/domain/repositories/product_repository.dart';

class GetSinglsProductUssecase {
  final ProductRepository repo;

  GetSinglsProductUssecase({required this.repo});

  Future<Either<Failure, Product>> call(int id) {
    return repo.getSingleProduct(id);
  }
}
