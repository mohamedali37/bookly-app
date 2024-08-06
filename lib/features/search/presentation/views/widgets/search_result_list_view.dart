import 'package:bookly_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if(state is SearchSuccess) {
          return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: state.books.length, (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerItem(
                    books: state.books[index],
                  ),
                );
              }));
            } else {
              return const BestSellerListView();
            }
        }
    );
  }
}
