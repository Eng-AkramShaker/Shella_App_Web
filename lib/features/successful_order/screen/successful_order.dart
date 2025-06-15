import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/drag_indicator.dart';
import 'package:shella_design/common/success_icon.dart';
import 'package:shella_design/features/successful_order/widget/return_home_button.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

class SuccessfulOrderBottomSheet extends StatelessWidget {
  const SuccessfulOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _bottomSheetDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DragIndicator(),
          const SizedBox(height: 16),
          custom_Images_asset(
            image: AppImages.success,
            h: 250,
            fit: BoxFit.contain,
          ),
          Custom_Text(
            context,
            text: "تم الطلب بنجاح",
            style: font18Black700W(context, size: size_22(context)),
          ),
          const SizedBox(width: 10),
          SuccessIcon(iconPath: AppImages.mark),
          Custom_Text(
            context,
            text: "تهانينا، تم تسليم الطلب الخاص بك الى \n السائق المسؤول عن التوصيل",
            style: font11Grey700W(context, size: size_14(context)),
            color: AppColors.gryColor_2,
            textAlign: TextAlign.center,
          ),
          ReturnHomeButton(onPressed: () {
            pushNewScreen(context, AppRoutes.mainLayout);
          }),
        ],
      ),
    );
  }

  BoxDecoration _bottomSheetDecoration() => BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      );
}
