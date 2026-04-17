import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double hight;
  final double width;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.hight = 50,
    this.width = 50,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: hight,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) =>
          Container(height: hight, width: width, color: Colors.grey),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
