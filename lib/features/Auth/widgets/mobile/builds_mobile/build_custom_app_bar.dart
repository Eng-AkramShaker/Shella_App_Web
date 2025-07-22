import 'package:flutter/material.dart';

PreferredSizeWidget buildCustomAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 30,
        color: Colors.black,
      ),
    ),
  );
}
