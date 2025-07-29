import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget buildCustomCarousolSlider(
    {int? itemCount, Widget Function(BuildContext, int, int)? itemBuilder}) {
  return CarouselSlider.builder(
    options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: true,
      disableCenter: true,
      viewportFraction: 0.8,
      autoPlayInterval: const Duration(seconds: 7),
      onPageChanged: (index, reason) {},
    ),
    itemCount: itemCount,
    itemBuilder: itemBuilder,
  );
}
