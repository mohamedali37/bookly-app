part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}
final class SearchInitial extends SearchState {}
final class SearchDefault extends SearchState {
  final List <BookModel> books;

  const SearchDefault({required this.books});
}


final class SearchSuccess extends SearchState {
  final List <BookModel> books;
  const SearchSuccess(this.books);
}
