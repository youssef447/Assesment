import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errMessage);
  

  factory ServiceFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return ServiceFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServiceFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServiceFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServiceFailure('Request to ApiServer was canceled');

      case DioExceptionType.badCertificate:
        if (dioError.message!.contains('SocketException')) {
          return ServiceFailure('No Internet Connection');
        }
        return ServiceFailure('Unexpected Error, Please try again!');
      default:
        return ServiceFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServiceFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServiceFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServiceFailure('Internal Server error, Please try later');
    } else {
      return ServiceFailure('Opps There was an Error, Please try again');
    }
  }
}
