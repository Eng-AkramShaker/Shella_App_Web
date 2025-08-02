import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? text;
  const ErrorTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h, // Fixed height for the error message area
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Error: ${text}'),
        ),
      ),
    );
  }
}
