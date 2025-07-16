// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/features/onboarding/widget/custombutton.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_images.dart';

class OnboardingEnd extends StatelessWidget {
  const OnboardingEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          custom_Images_asset(
            image: AppImages.onboarding4,
            fit: BoxFit.cover,
            w: MediaQuery.of(context).size.width,
            h: MediaQuery.of(context).size.height,
          ),
          Container(color: Colors.black.withOpacity(0.1)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 62,
                width: MediaQuery.of(context).size.width,
                child: CustomButtonOnBoarding(
                  text: "إبدأ",
                  onPressed: () {
                    nav.push(AppRoutes.Login_Mobile);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
