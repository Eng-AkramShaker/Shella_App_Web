import 'package:flutter/material.dart';

class ImageCircle extends StatelessWidget {
  final String img;
  const ImageCircle({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(img),
    );
  }
}
