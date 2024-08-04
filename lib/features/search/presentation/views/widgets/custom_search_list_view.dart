import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_message_error.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.books,
    required this.query,
  });

  final List<BookModel>? books;
  final String query;

  @override
  Widget build(BuildContext context) {
    List result = books!.where(
      (element) {
        return element.volumeInfo.title!.toLowerCase().startsWith(query);
      },
    ).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'result search',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<NewestBooksCubit, NewestBooksState>(
            builder: (context, state) {
              if (state is NewestBooksSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        query == '' ? state.newestBooks.length : result.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: BestSellerItem(
                          books: query == ''
                              ? state.newestBooks[index]
                              : result[index],
                        ),
                      );
                    },
                  ),
                );
              } else if (state is NewestBooksFailure) {
                return CustomMessageError(message: state.err);
              } else {
                return const CustomLoadingIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
