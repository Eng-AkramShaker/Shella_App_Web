import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/custom_image.dart';

class VisitAgainView extends StatefulWidget {
  const VisitAgainView({super.key});

  @override
  State<VisitAgainView> createState() => _VisitAgainViewState();
}

class _VisitAgainViewState extends State<VisitAgainView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            height: 150,
            width: double.infinity),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'قم بالزيارة مرة أخرى',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'احصل على مشترياتم الأخيرة من المتجر الذي قمت بزيارته',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),
              CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  disableCenter: true,
                ),
                itemBuilder: (context, index, realIndex) {
                  return SizedBox(
                    width: 200.h,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20.h),
                            Container(
                              height: 160.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      spreadRadius: 1),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 30.h),
                                  Flexible(
                                      child: Text(
                                    'Store Name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star,
                                          color: AppColors.primaryColor,
                                          size: 20),
                                      SizedBox(width: 5.h),
                                      Text(
                                        '3.8',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 5.h),
                                      Text('(4)',
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.storefront_outlined,
                                          color: Colors.grey, size: 20),
                                      SizedBox(width: 5.h),
                                      Flexible(
                                          child: Text(
                                        'Store Address',
                                        style: TextStyle(color: Colors.grey),
                                      ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 54,
                            width: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12),
                              child:
                                  CustomImage(image: AppImages.helpAndSupport),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 5,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_outline,
                                  color: AppColors.primaryColor)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
