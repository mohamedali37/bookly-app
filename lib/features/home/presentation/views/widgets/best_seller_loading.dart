import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerLoading extends StatelessWidget {
  const BestSellerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: 10,
      (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: SizedBox(
              height: 140,
              child: Row(children: [
                AspectRatio(
                    aspectRatio: 2.6 / 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                      ),
                    )),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: Column(children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20,
                        width: 48,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 20,
                        width: 48,
                        color: Colors.grey,
                      )
                    ],
                  )
                ])),
              ]),
            ),
          ),
        );
      },
    ));
  }
}
