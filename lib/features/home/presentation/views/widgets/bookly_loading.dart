import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BooklyLoading extends StatelessWidget {
  const BooklyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
