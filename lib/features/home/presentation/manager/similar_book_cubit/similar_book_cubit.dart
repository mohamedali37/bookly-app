import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());
  final HomeRepo homeRepo;
  Future<void> featchSimilarBooks({required String category}) async {
    emit(SimilarBookLoading());
    var result = await homeRepo.featchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBookFailure(error: failure.error));
    }, (newestBooks) {
      emit(SimilarBookSuccess(books: newestBooks));
    });
  }
}
