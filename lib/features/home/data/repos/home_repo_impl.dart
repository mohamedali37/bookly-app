import 'package:bookly_app/core/error/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> featchBestSellerBooks() async {
    try {
  var data = await apiServices.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:Programming');
  List<dynamic> booksList = data['items'];
  List<BookModel> books = [];
  for (var element in booksList) {
    books.add(BookModel.fromJson(element));
  }
  return right(books);
} catch (e) {
  if(e is DioException) {
    return left(ServerFailure.fromDioException(e));
  }
  return left(ServerFailure(e.toString()));
}
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchBooks() {
    // TODO: implement featchBooks
    throw UnimplementedError();
  }
}
