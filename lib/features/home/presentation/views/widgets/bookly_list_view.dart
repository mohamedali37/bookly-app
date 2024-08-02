import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_message_error.dart';
import 'package:bookly_app/features/home/presentation/manager/books_cubit/books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/books_cubit/books_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooklyListView extends StatelessWidget {
  const BooklyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if(state is BooksSuccessState) {
          return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomItemListView(book: state.books[index],),
                );
              }),
        );
        } else if (state is BooksFailureState) {
          return CustomMessageError(message: state.err);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
