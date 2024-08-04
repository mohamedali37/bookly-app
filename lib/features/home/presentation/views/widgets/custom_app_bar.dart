import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 24,
          ),
          const Spacer(),
          BlocBuilder<NewestBooksCubit, NewestBooksState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  //GoRouter.of(context).push(AppRouters.kSearchView);
                  showSearch(context: context, delegate: SearchView(
                    state is NewestBooksSuccess? state.newestBooks : [],
                  ));
                },
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 30,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
