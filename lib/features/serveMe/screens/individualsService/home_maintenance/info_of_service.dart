import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

class InfoOfService extends StatelessWidget {
  final String name;
  final String image;
  const InfoOfService({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(
        context,
        style: font12White600W(context, size: size_14(context)),
        title: name,
        onPressed: () {
          popRoute(context);
        },
        icon: Icons.settings,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 252,
            child: Card(
              color: AppColors.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    custom_Images_asset(image: image, h: 190, w: 350),
                    Spacer(flex: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Custom_Text(
                          context,
                          text: "250 تقييم",
                          style: font10Black300W(
                            context,
                            size: size_14(context),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 152,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Custom_Text(
                                context,
                                text: "4.7",
                                style: font10Black300W(
                                  context,
                                  size: size_14(context),
                                ),
                              ),
                              Spacer(flex: 1),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: AppColors.bgColor,
                              ),
                              Spacer(flex: 1),
                              Icon(Icons.star, size: 20, color: AppColors.gold),
                              Spacer(flex: 1),
                              Icon(Icons.star, size: 20, color: AppColors.gold),
                              Spacer(flex: 1),
                              Icon(Icons.star, size: 20, color: AppColors.gold),
                              Spacer(flex: 1),
                              Icon(Icons.star, size: 20, color: AppColors.gold),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Card(
              color: AppColors.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(AppImages.icon_cach_2),
                      color: AppColors.greenColor,
                      size: 24,
                    ),
                    Spacer(flex: 1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(
                          context,
                          text: "يبدأ من 150 ريال ",
                          style: font10Black600W(
                            context,
                            size: size_16(context),
                          ),
                        ),
                        Custom_Text(
                          context,
                          text: "السعر يشمل الكشف والمعاينة",
                          style: font10Black400W(
                            context,
                            size: size_14(context),
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 170,
            child: Card(
              color: AppColors.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(
                      context,
                      text: "مميزات الخدمة",
                      style: font11Black500W(context, size: size_16(context)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.gryColor_8,
                          ),
                          child: _customServiceRow(
                            icon: Icons.verified_user,
                            text: "ضمان الخدمة",
                            context: context,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.gryColor_8,
                          ),
                          child: _customServiceRow(
                            icon: Icons.access_time_filled,
                            text: "خدمة 24/24",
                            context: context,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.gryColor_8,
                          ),
                          child: _customServiceRow(
                            icon: Icons.engineering_rounded,
                            text: "فنيين معتمدين",
                            context: context,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.gryColor_8,
                          ),
                          child: _customServiceRow(
                            icon: Icons.settings_suggest,
                            text: "قطع غيار اصلية",
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 187,
            child: Card(
              color: AppColors.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(
                      context,
                      text: "تفاصيل الخدمة",
                      style: font11Black500W(context, size: size_16(context)),
                    ),
                    SizedBox(
                      width: 172,
                      child: _customServiceRow(
                        isSpacerStart: false,
                        icon: Icons.verified_rounded,
                        text: "صيانة وإصلاح تسريب المياه",
                        context: context,
                      ),
                    ),
                    SizedBox(
                      width: 172,
                      child: _customServiceRow(
                        isSpacerStart: false,
                        icon: Icons.verified_rounded,
                        text: "تركيب وصيانة خلاطات المياه",
                        context: context,
                      ),
                    ),
                    SizedBox(
                      width: 172,
                      child: _customServiceRow(
                        isSpacerStart: false,
                        icon: Icons.verified_rounded,
                        text: "تركيب وصيانة السخانات",
                        context: context,
                      ),
                    ),
                    SizedBox(
                      width: 172,
                      child: _customServiceRow(
                        isSpacerStart: false,
                        icon: Icons.verified_rounded,
                        text: "تركيب وصيانة اطقم الحمام",
                        context: context,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: custom_Button(
              context,
              h: 45,
              title: "اختار الفني",
              style: font10White400W(context, size: size_14(context)),
              onPressed: () {
                pushNewScreen(context, AppRoutes.choiseATechnincal);
              },
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _customServiceRow({
    required IconData icon,
    required String text,
    Color iconColor = Colors.green,
    double iconSize = 20,
    int startSpacerFlex = 1,
    int medSpacerFlex = 1,
    int endSpacerFlex = 3,
    TextStyle? textStyle,
    required BuildContext context,
    bool isSpacerStart = true,
    bool isSpacermed = true,
    bool isSpacerend = true,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isSpacerStart ? Spacer(flex: startSpacerFlex) : const SizedBox.shrink(),
        Icon(icon, size: iconSize, color: iconColor),
        isSpacermed ? Spacer(flex: medSpacerFlex) : const SizedBox.shrink(),
        Custom_Text(
          context,
          text: text,
          style: textStyle ?? font10Black400W(context, size: size_12(context)),
        ),
        isSpacerend ? Spacer(flex: endSpacerFlex) : const SizedBox.shrink(),
      ],
    );
  }
}
