import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/search_filter/widget/mobile/site_dropdown_menu.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../../controller/search_filter_controller.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key, required this.num, required this.sites});

  final List<String> sites;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (SearchFilterController.get(context).addressModel != null)
            Row(
              children: [
                Custom_Text(
                  context,
                  style: font10Black300W(context, size: size_13(context)),
                  text: "الموقع الحالي :",
                ),
                const SizedBox(width: 5),
                Custom_Text(
                  context,
                  style: font10Black300W(context, size: size_11(context)),
                  text: SearchFilterController.get(context).addressModel!.addresses?[0].address ?? '',
                ),
              ],
            ),
          Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  nav.push(AppRoutes.cartScreen);
                },
                child: custom_Images_asset(
                  image: AppImages.basket,
                  h: 25,
                  w: 25,
                ),
              ),
              if (num > 0)
                Positioned(
                  right: -4,
                  bottom: 18,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(num.toString(), style: font12Green400W(context, size: size_11(context))),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
