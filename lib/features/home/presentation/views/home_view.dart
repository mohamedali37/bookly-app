import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoubleBackToCloseApp(
          snackBar: SnackBar(content: Text('click again to close app')),
          child: HomeViewBody()),
    );
  }
}
