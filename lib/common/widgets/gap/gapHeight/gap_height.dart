import 'package:flutter/material.dart';

class GapHeight extends StatelessWidget {
  const GapHeight({super.key, required this.gap});

  final double gap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height*gap,);
  }
}
