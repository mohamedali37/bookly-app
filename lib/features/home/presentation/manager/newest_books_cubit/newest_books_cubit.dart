import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  late List<BookModel> bookList;
  Future<void> featchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.featchBestSellerBooks();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.error));
      }, 
      (books) {
        bookList = books;
        emit(NewestBooksSuccess(bookList));
      });
  }
}
