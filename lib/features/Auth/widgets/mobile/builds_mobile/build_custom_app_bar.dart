import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_navigators.dart';

PreferredSizeWidget buildCustomAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        popRoute(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 30,
        color: Colors.black,
      ),
    ),
  );
}
