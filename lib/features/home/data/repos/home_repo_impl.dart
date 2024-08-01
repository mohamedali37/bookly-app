import 'package:bookly_app/core/error/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> featchBestSellerBooks() async {
    var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:Programming');
    List<BookModel> book = [];
    data.fold((l) => l, (books) {
      List<dynamic> booksList = books['items'];
      for (var element in booksList) {
        book.add(BookModel.fromJson(element));
      }
    });
    return right(book);
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchBooks() async {
    var result = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
    List<BookModel> book = [];
    result.fold((l) => l, (books) {
      List<dynamic> bookList = books['items'];
      for (var element in bookList) {
        book.add(BookModel.fromJson(element));
      }
    });
    return right(book);
  }
}
