import 'package:bookly_app/constatnts.dart';
import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.books});
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.kBookDetailsView, extra: books);
      },
      child: SizedBox(
        height: 140,
        child: Row(children: [
          CustomItemListView(image: books.volumeInfo.imageLinks.thumbnail),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    books.volumeInfo.title!,
                    style: Styles.textStyle20.copyWith(fontFamily: kGTSectra),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  books.volumeInfo.authors![0],
                  style: Styles.textStyle14,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text('Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    BookRating(
                      bookModel: books,
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
