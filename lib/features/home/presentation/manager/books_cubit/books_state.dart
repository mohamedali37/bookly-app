import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class BooksState {}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class BooksSuccessState extends BooksState {
  final List<BookModel> books;

  BooksSuccessState(this.books);
}

class BooksFailureState extends BooksState {
  final String err;

  BooksFailureState(this.err);
}
