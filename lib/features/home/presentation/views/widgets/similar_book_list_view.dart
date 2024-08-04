import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_message_error.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if(state is SimilarBookSuccess) {
          return SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouters.kBookDetailsView, extra: state.books[index]);
                    },
                    child: CustomItemListView(
                      image: state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                );
              }),
        );
        } else if (state is SimilarBookFailure) {
          return CustomMessageError(message: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
