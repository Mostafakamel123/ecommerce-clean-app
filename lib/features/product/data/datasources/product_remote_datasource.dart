import 'package:ecommcere_clean_app/core/databases/api/api_consumer.dart';
import 'package:ecommcere_clean_app/core/databases/api/end_points.dart';

import 'package:ecommcere_clean_app/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getproduct();
  Future<ProductModel> getSingleproduct(int id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final ApiConsumer api;

  ProductRemoteDataSourceImpl({required this.api});

  @override
  Future<ProductModel> getSingleproduct(int id) async {
    final response = await api.get("${EndPoint.products}/$id");
    return ProductModel.fromJson(response);
  }

  @override
  Future<List<ProductModel>> getproduct() async {
    final response = await api.get(EndPoint.products);
    return (response.data as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}
