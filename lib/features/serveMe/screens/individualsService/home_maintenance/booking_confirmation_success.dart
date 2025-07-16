import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/features/serveMe/widgets/booking_status.dart';
import 'package:shella_design/features/serveMe/widgets/service_summary.dart';
import 'package:shella_design/features/serveMe/widgets/technical_details.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class BookingConfirmationSuccess extends StatelessWidget {
  const BookingConfirmationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        children: [
          SizedBox(height: 240, child: BookingStatus()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TechnicalDetails(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ServiceSummary(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: custom_Button(context, title: "تتبع الفني", onPressed: () {
              nav.push(AppRoutes.technicalTracking);
            }, style: font10White400W(context, size: size_14(context)), h: 45),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: custom_Button(context,
                buttoncolor: AppColors.gryColor_3,
                border_color: AppColors.gryColor_3,
                title: "العودة للرئيسية",
                onPressed: () {},
                style: font12SecondaryColor400W(context, size: size_14(context)),
                h: 45),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
