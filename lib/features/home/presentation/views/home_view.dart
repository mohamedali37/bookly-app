import 'dart:io';

import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        return await onPopMethod(context);
      },
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }

  onPopMethod(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        title: Text(
          'Exit',
        ),
        content: Text('Do you want to exit app'),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () => exit(0),
              child: Text('Exit')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('return'))
        ],
      ),
    );
  }
}
