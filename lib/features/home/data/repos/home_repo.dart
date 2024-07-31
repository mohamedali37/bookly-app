import 'package:bookly_app/core/error/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookModel>>> featchBooks();
  Future<Either<Failure,List<BookModel>>> featchBestSellerBooks();
}



// https://www.googleapis.com/books/v1/volumes?q=programming