import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildBanner(context, {PageController? controller}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      SizedBox(
        height: height(context, 0.13),
        child: PageView.builder(
          controller: controller,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(HomeController.get(context).homeBannersModel!.banners![index].imageFullUrl??'',fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) => SizedBox(),)),
          ),
          itemCount: HomeController.get(context).homeBannersModel!.banners!.length,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: SmoothPageIndicator(
          controller: controller!,
          count: HomeController.get(context).homeBannersModel!.banners!.length,
          effect: WormEffect(
            activeDotColor: AppColors.gold,
            dotColor: AppColors.gryColor_3,
            dotHeight: 8,
            dotWidth: 8,
          )
        ),
      )
    ],
  );
}