import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomMessageError extends StatelessWidget {
  const CustomMessageError({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: Styles.textStyle18,
      ),
    );
  }
}