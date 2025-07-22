import 'package:flutter/material.dart';

class NavBarState {
  static final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  static void setIndex(int index) {
    currentIndex.value = index;
  }
}
