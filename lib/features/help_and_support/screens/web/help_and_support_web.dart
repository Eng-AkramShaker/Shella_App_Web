import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/gap/height/height.dart';
import 'package:shella_design/common/widgets/gap/width/width.dart';
import '../../../../common/util/app_colors.dart';
import '../../../../common/util/app_images.dart';
import '../../../../common/widgets/images/custom_Images.dart';
import '../../widgets/mobile/address_container.dart';
import '../../widgets/mobile/contact_us_container.dart';
import '../../widgets/mobile/email_us_container.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          width(context, 1) > 600 ? width(context, 0.7) : width(context, 0.9),
      child: Card(
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(
            color: AppColors.gryColor_5,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              custom_Images_asset(
                  image: AppImages.helpAndSupport,
                  h: height(context, 0.3),
                  w: width(context, 0.6),
                  fit: BoxFit.fill),
              SizedBox(height: 30),
              AddressContainer(),
              SizedBox(
                height: 10,
              ),
              ContactUsContainer(),
              SizedBox(
                height: 10,
              ),
              EmailUsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
