import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_styles.dart';

class BookingStatus extends StatelessWidget {
  const BookingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      height: 240,
      child: Center(
        child: Column(
          children: [
            Spacer(flex: 1),
            Custom_Text(context,
                text: "تاكيد الحجز",
                style: font12White500W(context, size: size_16(context))),
            SizedBox(height: 10),
            CircleAvatar(
              backgroundColor: AppColors.backgroundColor,
              radius: 35.r,
              child: CircleAvatar(
                backgroundColor: AppColors.greenColor,
                child: Icon(
                  Icons.check,
                  color: AppColors.backgroundColor,
                  size: 25.r,
                ),
              ),
            ),
            SizedBox(height: 10),
            Custom_Text(context,
                text: "تم تاكيد الحجز بنجاح",
                style: font12White500W(context, size: size_21(context))),
            SizedBox(height: 10),
            Custom_Text(context,
                text: "رقم الحجز : #224558",
                style: font10White400W(context, size: size_16(context))),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
