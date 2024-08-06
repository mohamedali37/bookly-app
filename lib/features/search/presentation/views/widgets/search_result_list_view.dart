import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_message_error.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
       if(state is DataSuccess) {
          return SearchList(books: state.books);
       } else if(state is DataFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CustomMessageError(message: state.error)));
       } else if (state is SearchSuccess) {
          return SearchList(books: state.books);
       } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CustomLoadingIndicator()),
          );
       }
      });        
}
}

class SearchList extends StatelessWidget {
  const SearchList({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: books.length, (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerItem(
                    books: books[index],
                  ),
                );
              }));
  }
}
