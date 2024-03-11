import 'package:assesment_app/config/end_points/end_points.dart';
import 'package:assesment_app/config/services/dio_helper.dart';
import 'package:dio/dio.dart';

class ProductServices {
  Future<Response> getProducts() async {
    return await DioHelper.getData(
      method: ApiEndPoints.productEndPoint,
    );
  }
}
