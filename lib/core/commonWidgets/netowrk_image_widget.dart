import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.image,
    required this.height,
  });
  final String image;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.scaleDown,
      placeholder: (context, url) => Container(
        height: height,
        color: Colors.grey.shade300,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error, size: 50),
    );
  }
}
