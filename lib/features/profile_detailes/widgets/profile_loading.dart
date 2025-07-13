import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({super.key, required this.color, this.size = 25});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color,
      size: size,
    );
  }
}
