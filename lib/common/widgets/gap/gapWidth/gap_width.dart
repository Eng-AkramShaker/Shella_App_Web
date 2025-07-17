import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

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
