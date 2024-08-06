import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  HomeRepo homeRepo;
  late List<BookModel> bookList;
  Future <void> data () async{
    emit(DataLoading());
    var result = await homeRepo.searchBooks();
    result.fold(
      (failure) {
        emit(DataFailure(error: failure.error));
      }, 
      (book) {
        bookList = book;
        emit(DataSuccess(books: bookList));
      }
      );
  }

  void onSearch(String value) {
    if (value.isEmpty) {
      emit(DataSuccess(books: bookList));
    } else {
      List<BookModel> data = bookList
          .where((element) =>
              element.volumeInfo.title!.toLowerCase().startsWith(value))
          .toList();
      emit(SearchSuccess(books: data));
    }
  }
}
