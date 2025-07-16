import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ServiceSummary extends StatelessWidget {
  const ServiceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 325,
        child: Card(
            color: AppColors.backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(context, text: "ملخص الخدمة", style: font11Black500W(context, size: size_16(context))),
                    _buildserviceinfo(context, Icons.miscellaneous_services_outlined, "نوع الخدمة", 'صيانة السباكة'),
                    _buildserviceinfo(context, Icons.home_outlined, "المنزل", 'السعودية , الرياض 55552333'),
                    _buildserviceinfo(context, Icons.date_range_outlined, "التاريخ", '25 فبراير'),
                    _buildserviceinfo(context, Icons.access_time_outlined, "الوقت", '9:00'),
                    _buildserviceinfo(context, Icons.account_balance_wallet_outlined, "طريقة الدفع", 'الدفع نقدآ'),
                  ],
                ))));
  }
}

Widget _buildserviceinfo(BuildContext context, IconData icon, String maintext, String sectext) {
  return Row(
    children: [
      ClipOval(
        child: Container(
          height: 38,
          width: 38,
          color: AppColors.gryColor_9,
          child: Icon(
            icon,
            size: 28,
            color: AppColors.greenColor,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(context, text: maintext, style: font10Black400W(context)),
          Custom_Text(context, text: sectext, style: font10Grey400W(context)),
        ],
      ),
    ],
  );
}
