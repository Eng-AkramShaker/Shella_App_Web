import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

class NavBarState {
  static final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  static void setIndex(int index) {
    currentIndex.value = index;
  }
}
