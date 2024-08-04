/*import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}*/



import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_list_view.dart';
import 'package:flutter/material.dart';

class SearchView extends SearchDelegate {
  // ignore: prefer_typing_uninitialized_variables
  List<BookModel>? books;
  SearchView(this.books);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchListView(books: books, query: query);
  }
}
