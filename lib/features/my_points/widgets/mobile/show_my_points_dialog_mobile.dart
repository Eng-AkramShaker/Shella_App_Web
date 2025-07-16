import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/widgets/texts/text_button.dart';

class ShowMyPointsDialogMobile extends StatelessWidget {
  final bool discount;
  final String image;
  final String title;
  final String subTitle;
  final Widget widget;
  final String buttonText;
  final VoidCallback onTap;

  const ShowMyPointsDialogMobile(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.widget,
      required this.buttonText,
      required this.discount,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r), // Adjust the radius as needed
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
              height: 200.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Custom_Text(
                  context,
                  text: title,
                  style: font14Black500W(context),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Custom_Text(
                  context,
                  text: subTitle,
                  style: font10Grey500W(context),
                ),
                SizedBox(
                  height: 10.h,
                ),
                widget,
                SizedBox(
                  height: 10,
                ),
                discount
                    ? Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColors.gryColor_6,
                      )
                    : Container(),
                discount
                    ? SizedBox(
                        height: 10.h,
                      )
                    : SizedBox(
                        height: 0.h,
                      ),
                discount
                    ? Custom_Text(
                        context,
                        text: 'عدد النقاط حاليآ : 1500 نقطة',
                        style: font10Grey500W(context),
                      )
                    : Container(),
                discount
                    ? SizedBox(
                        height: 10.h,
                      )
                    : SizedBox(
                        height: 0.h,
                      ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.greenColor,
                  ),
                  child: TextButtonWidget(
                    onPressed: onTap,
                    text: buttonText,
                    radius: 8,
                    height: 40,
                    verticalPadd: 0,
                    horizontalPadd: 0,
                    textStyle: font12White500W(context),
                    width: double.infinity,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
