import 'package:flutter/material.dart';
import 'package:shella_design/util/app_images.dart';

class SearchFilterController with ChangeNotifier {
  String selectedCategory = 'اصناف المتاجر';
  final List<String> previousSearches = ['عروض وخصومات', 'مشروبات', 'ماركت'];

  final List<String> img = [
    AppImages.item_42,
    AppImages.item_42,
    AppImages.item_42,
    AppImages.item_42,
    AppImages.item_42,
  ];

  final int cartNum = 5;

  final List<String> sites = [
    'موقع 1',
    'موقع 2',
    'موقع 3',
    'موقع 4',
  ];

  final List<String> text = [
    "عروض وتخفيضات",
    "متاجر جديدة",
    "مشروبات وقهوة",
    "المخبوزات",
    "شوكولا",
  ];
}
