import 'package:flutter/material.dart';

class BannerContainerImageWidget extends StatelessWidget {
  final String imageUrl;
  const BannerContainerImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 0)
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Icon(Icons.broken_image));
          },
        ),
      ),
    );
  }
}
