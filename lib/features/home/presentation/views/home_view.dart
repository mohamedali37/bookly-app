import 'dart:io';

import 'package:bookly_app/core/utils/styles.dart';
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
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        content: const Text(
          'Do you want to exit app ?',
          style: Styles.textStyle16,
          ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () => exit(0),
              child: Text(
                'Yes',
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                ),
                )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                ),
                ))
        ],
      ),
    );
  }
}
