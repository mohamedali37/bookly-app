import 'package:bookly_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;
  ApiServices(this.dio);

  Future<Either<Failure, Map<String, dynamic>>> get(
      {required String endPoint}) async {
    try {
      var respone = await dio.get('$_baseUrl$endPoint');
      return right(respone.data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
