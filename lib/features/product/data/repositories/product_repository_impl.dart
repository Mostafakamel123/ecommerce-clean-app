import 'package:dartz/dartz.dart';
import 'package:ecommcere_clean_app/core/connection/network_info.dart';

import 'package:ecommcere_clean_app/core/errors/expentions.dart';
import 'package:ecommcere_clean_app/core/errors/failure.dart';
import 'package:ecommcere_clean_app/features/product/data/datasources/product_remote_datasource.dart';
import 'package:ecommcere_clean_app/features/product/domain/entities/product_entity.dart';
import 'package:ecommcere_clean_app/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSourceImpl remote;
  final NetworkInfoImpl connect;

  ProductRepositoryImpl({required this.remote, required this.connect});

  ////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await connect.isConnected) {
      try {
        final products = await remote.getproduct();
        return right(products);
      } on ServerException catch (e) {
        return left(Failure(errMessage: e.errModel.errorMessage));
      }
    } else {
      return left(Failure(errMessage: "no internet"));
    }
  }

  /////////////////////////////////////////////////////////////////////

  @override
  Future<Either<Failure, Product>> getSingleProduct(int id) async {
    if (await connect.isConnected) {
      try {
        final product = await remote.getSingleproduct(id);
        return right(product);
      } on ServerException catch (e) {
        return left(Failure(errMessage: e.errModel.errorMessage));
      }
    } else {
      return left(Failure(errMessage: "nointernet"));
    }
  }

  ///////////////////////////////////////////////////////////////////////
}
