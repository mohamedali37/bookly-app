import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch(dioException.type) {

      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromRespone(dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error with api server');

      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexception error, please try later');
      default:
          return ServerFailure('There was an error, plase try again');
    }
  }

  factory ServerFailure.fromRespone (int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Error in Server, please try later');
    } else {
      return ServerFailure('There was an error, plase try again');
    }
  }
}
