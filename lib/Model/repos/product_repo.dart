import 'package:assesment_app/Model/models/product_model.dart';
import 'package:assesment_app/core/utils/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../data_sources/product_services.dart';
import '../models/product_details_model.dart';

class ProductRepo {
  late final ProductServices _service;
  ProductRepo({required ProductServices service}) {
    _service = service;
  }

  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await _service.getProducts();
      return Right((response.data['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList());
    } on DioException catch (e) {
      return Left(ServiceFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, ProductDetailsModel>> getProductDetails(
      {required String productId}) async {
        
    try {
      final response = await _service.getProductDetails(query: {'': productId});
      return Right( ProductDetailsModel.fromJson(response.data['data']));
    } on DioException catch (e) {
      return Left(ServiceFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
}
