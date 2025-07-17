import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class SelectService extends StatefulWidget {
  const SelectService({super.key});

  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  int isSelected = 1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: SizedBox(height: 500, child: _buildDialogContent(context)),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 2),
        Custom_Text(context, text: "اختر نوع الطلب", style: font11Black500W(context, size: size_21(context))),
        Spacer(flex: 2),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 1;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: isSelected == 1 ? AppColors.greenColor : AppColors.gryColor_5, width: 2.w),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: SizedBox(
                  height: 100,
                  width: 340,
                  child: Center(
                      child: Row(
                    children: [
                      ClipOval(
                        child: custom_Images_asset(image: AppImages.individuals, h: 42, w: 42),
                      ),
                      Spacer(flex: 1),
                      Custom_Text(context,
                          text: "طلب فوري",
                          style: isSelected == 1
                              ? font10Black400W(context, size: size_16(context))
                              : font10Grey400W(context, size: size_16(context))),
                      Spacer(flex: 6),
                    ],
                  ))),
            ),
          ),
        ),
        Spacer(flex: 1),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 2;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: isSelected == 2 ? AppColors.greenColor : AppColors.gryColor_5, width: 2.w),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: SizedBox(
                  height: 100,
                  width: 340,
                  child: Center(
                      child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: custom_Images_asset(image: AppImages.date, h: 80, w: 80),
                      ),
                      Spacer(flex: 1),
                      Custom_Text(context,
                          text: "تحديد موعد الطلب",
                          style: isSelected == 2
                              ? font10Black400W(context, size: size_16(context))
                              : font10Grey400W(context, size: size_16(context))),
                      Spacer(flex: 6),
                    ],
                  ))),
            ),
          ),
        ),
        Spacer(flex: 4),
      ],
    );
  }
}
