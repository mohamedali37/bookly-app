part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}
final class SearchInitial extends SearchState {}
final class DataLoading extends SearchState {}
final class DataFailure extends SearchState {
  final String error;

  const DataFailure({required this.error});
}
final class DataSuccess extends SearchState {
  final List<BookModel> books;

  const DataSuccess({required this.books});
}



final class SearchSuccess extends SearchState {
  final List <BookModel> books;
  const SearchSuccess({required this.books});
}
