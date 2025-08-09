import 'package:dartz/dartz.dart';
import 'package:ecommcere_clean_app/core/errors/failure.dart';

import 'package:ecommcere_clean_app/features/product/domain/entities/product_entity.dart';
import 'package:ecommcere_clean_app/features/product/domain/repositories/product_repository.dart';

class GetAllproductsUsecase {
  final ProductRepository repo;

  GetAllproductsUsecase({required this.repo});

  Future<Either<Failure, List<Product>>> call() async {
    return repo.getA