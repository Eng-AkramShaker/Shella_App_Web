// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class nav {
  static get _Nav => navigatorKey.currentState!;

  static Future push(String route, {Object? args}) =>
      _Nav.pushNamed(route, arguments: args);

  static Future replace(String route, {Object? args}) =>
      _Nav.pushReplacementNamed(route, arguments: args);

  static Future pushAndRemoveUnti(String route, {Object? args}) =>
      _Nav.pushNamedAndRemoveUntil(route, (r) => false, arguments: args);

  static Future untilFirst(String route, {Object? args}) =>
      _Nav.pushNamedAndRemoveUntil(route, (r) => r.isFirst, arguments: args);

  static void back() => _Nav.pop();
}
