// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget CounterButton(
    {required IconData? icon,
      double? size,
      required Color? color,
      required VoidCallback? onPressed}) {
  return IconButton(
    icon: Icon(icon, size: size ?? 30, color: color),
    onPressed: onPressed,
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints(),
  );
}