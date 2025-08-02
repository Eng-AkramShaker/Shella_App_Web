import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class VisitAgainShimmerView extends StatelessWidget {
  const VisitAgainShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        height: 150,
        width: double.infinity,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(children: [
          Shimmer(
            child: Container(
              height: 10,
              width: 100,
              color: Theme.of(context).shadowColor,
            ),
          ),
          SizedBox(height: 10.h),
          Shimmer(
            child: Container(
              height: 10,
              width: 200,
              color: Theme.of(context).shadowColor,
            ),
          ),
          SizedBox(height: 20.h),
          CarouselSlider.builder(
            itemCount: 5,
            options: CarouselOptions(
              aspectRatio: 2.2,
              enlargeCenterPage: true,
              disableCenter: true,
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Shimmer(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).shadowColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    ]);
  }
}
