import 'package:flutter/material.dart';

class GapWidth extends StatelessWidget {
  const GapWidth({super.key, required this.gap});
  final double gap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * gap,
    );
  }
}
