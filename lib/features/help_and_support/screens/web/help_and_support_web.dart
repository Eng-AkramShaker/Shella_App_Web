import 'package:flutter/material.dart';
import '../../../../common/util/app_colors.dart';
import '../../../../common/util/app_images.dart';
import '../../../../common/widgets/images/custom_Images.dart';
import '../../widgets/address_container.dart';
import '../../widgets/contact_us_container.dart';
import '../../widgets/email_us_container.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 850,
      height: 850,
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
              SizedBox(
                height: 250,
                width: 800,
                child: custom_Images_asset(
                  image: AppImages.helpAndSupport,
                  h: 250,
                  w: 800,
                  fit: BoxFit.fill),
              ),
              SizedBox(height: 40),
              AddressContainer(),
              ContactUsContainer(),
              EmailUsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
