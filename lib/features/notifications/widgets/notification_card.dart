import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      custom_Images_asset(
                        image: AppImages.item_12,
                        h: 50,
                        w: 50,
                      ),
                      SizedBox(width: 10),
                      Custom_Text(
                        context,
                        text: "دوبلها من بيتزا هت",
                        style: font10Black400W(context, size: size_10(context)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Custom_Text(
                        context,
                        text:
                            'اشتري 2 بيتزا فصول اربعة بسعر واحدة \n من بيتزا هت واحصل على توصيل مجاني',
                        style: font10Black300W(context, size: size_12(context)),
                      ),
                      Custom_Text(
                        context,
                        text: 'قبل 46 دقيقة',
                        style: font10Black400W(context, size: size_8(context)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: IconButtonCircle(onPressed: () {}, icon: Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
