import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomItemListView extends StatelessWidget {
  const CustomItemListView({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          /*placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),*/
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        /*Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(book.volumeInfo.imageLinks.thumbnail),
              )),
        ),*/
      ),
    );
  }
}
