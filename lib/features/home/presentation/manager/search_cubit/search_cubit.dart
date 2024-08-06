import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void onSearch(context, String value) {
    if (value.isEmpty) {
      emit(SearchInitial());
    } else {
      List<BookModel> data = BlocProvider.of<NewestBooksCubit>(context)
          .bookList
          .where((element) =>
              element.volumeInfo.title!.toLowerCase().contains(value))
          .toList();
      emit(SearchSuccess(books: data));
    }
  }
}
