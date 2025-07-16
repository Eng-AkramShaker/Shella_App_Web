import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class BookingInformation extends StatelessWidget {
  const BookingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gryColor_8,
      ),
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(context, text: "رقم الحجز", style: font10Black300W(context, size: size_14(context))),
                Custom_Text(context, text: "#244558", style: font10Black400W(context, size: size_14(context))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(context, text: "نوع الخدمة", style: font10Black300W(context, size: size_14(context))),
                Custom_Text(context, text: "صيانة السباكة", style: font10Black400W(context, size: size_14(context))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(context, text: "التاريخ والوقت", style: font10Black300W(context, size: size_14(context))),
                Custom_Text(context, text: "25 فبراير - 9:00", style: font10Black400W(context, size: size_14(context))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
