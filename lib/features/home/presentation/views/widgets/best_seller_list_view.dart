import 'package:bookly_app/core/widgets/custom_message_error.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: state.newestBooks.length, (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BestSellerItem(
                books: state.newestBooks[index],
              ),
            );
          }));
        } else if (state is NewestBooksFailure) {
          return SliverFillRemaining(
              hasScrollBody: false,
              child: CustomMessageError(message: state.err));
        } else {
          return const BestSellerLoading();
        }
      },
    );
  }
}
