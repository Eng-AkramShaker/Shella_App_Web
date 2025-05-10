import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/search_filter/widget/site_dropdown_menu.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key, required this.num, required this.sites});

  final List<String> sites;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Custom_Text(
                context,
                style: font10Black300W(context, size: size_11(context)),
                text: "التوصيل الى:",
              ),
              const SizedBox(width: 10),
              SiteDropdownMenu(sites: sites),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  pushNewScreen(context, AppRoutes.cartScreen);
                },
                child: custom_Images_asset(
                  image: AppImages.basket,
                  h: 30,
                  w: 30,
                ),
              ),
              if (num > 0)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(num.toString(),
                        style:
                            font12Green400W(context, size: size_11(context))),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
