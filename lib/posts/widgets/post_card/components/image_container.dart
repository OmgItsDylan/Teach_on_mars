import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teach_on_mars_test/posts/widgets/loader_widge/core.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, this.url, this.borderRadius});

  final String? url;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: Colors.grey[100],
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: url ?? 'https://static.thenounproject.com/png/504708-200.png',
        errorWidget: (context, url, error) => const Icon(Icons.error),
        placeholder: (context, url) => const Center(
          child: LoaderWidget(size: 30),
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
