import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button_2.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/features/serveMe/widgets/arrival_time.dart';
import 'package:shella_design/features/serveMe/widgets/service_summary.dart';
import 'package:shella_design/features/serveMe/widgets/technical_info.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

class TechnicalTracking extends StatelessWidget {
  const TechnicalTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context,
          style: font12White600W(context, size: size_14(context)),
          title: "تتبع الفني", onPressed: () {
        popRoute(context);
      }, icon: Icons.map_rounded),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TechnicalInfo(
              isicon: true,
            ),
            SizedBox(height: 15),
            ArrivalTime(),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: custom_Images_asset(
                  image: AppImages.map3,
                  h: 215,
                  w: MediaQuery.of(context).size.width),
            ),
            ServiceSummary(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: custom_Button(
                  context,
                  isIcon: true,
                  icon: Icons.phone_in_talk_outlined,
                  iconcolor: AppColors.backgroundColor,
                  title: "اتصال",
                  style: font12White700W(context, size: size_16(context)),
                  onPressed: () {},
                  h: 55,
                )),
                Expanded(
                    child: custom_Button(
                  context,
                  isIcon: true,
                  icon: Icons.message_outlined,
                  iconcolor: AppColors.backgroundColor,
                  title: "رسالة",
                  style: font12White700W(context, size: size_16(context)),
                  onPressed: () {},
                  h: 55,
                )),
              ],
            ),
            custom_Button(context,
                buttoncolor: AppColors.gryColor_3,
                bordersidecolor: AppColors.gryColor_3,
                title: "العودة للرئيسية",
                onPressed: () {},
                style:
                    font12SecondaryColor400W(context, size: size_14(context)),
                h: 45),
          ],
        ),
      ),
    );
  }
}
