import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/books_cubit/books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homeRepo) : super(BooksInitialState());
  final HomeRepo homeRepo;
  Future<void> featchBooks() async{
    emit(BooksLoadingState());
    var data = await homeRepo.featchBooks();
    data.fold(
      (failure) {
        emit(BooksFailureState(failure.error));
      }, (books) {
        emit(BooksSuccessState(books));
      });
  }
}