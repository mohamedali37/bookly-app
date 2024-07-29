import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_item_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.17),
            child: const CustomItemListView(),
          ),
          const SizedBox(height: 43,),
          Text(
            'The jungle book',
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 6,),
          Opacity(
            opacity: 0.7,
            child: Text(
              'Rydiary kibring',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
              ),
          ),
        ],
      ),
    );
  }
}

