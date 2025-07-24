import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

class ProfileDivider extends StatelessWidget {
  final double height;
  final double start;
  final double end;

  const ProfileDivider({super.key, this.height = 0, this.start = 0.04, this.end = 0.07});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Divider(
      height: height,
      indent: width * start,
      endIndent: width * end,
    );
  }
}