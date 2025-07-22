import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/onboarding/controller/onboarding_controller.dart';
import 'package:shella_design/features/onboarding/controller/static.dart';
import 'package:shella_design/features/onboarding/widget/custombutton.dart';
import 'package:shella_design/features/onboarding/widget/dotcontroller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context, provider, child) {
        return PageView.builder(
          controller: provider.pageController,
          onPageChanged: provider.onPageChanged,
          itemCount: onBoardingList.length,
          itemBuilder: (context, i) => Stack(
            children: [
              custom_Images_asset(
                image: onBoardingList[i].image!,
                fit: BoxFit.cover,
                w: MediaQuery.of(context).size.width,
                h: MediaQuery.of(context).size.height,
              ),
              Container(color: Colors.black.withOpacity(0.1)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(
                      context,
                      text: onBoardingList[i].title!,
                      style: font12White700W(context, size: size_24(context)),
                      color: AppColors.backgroundColor,
                    ),
                    const SizedBox(height: 10),
                    Custom_Text(
                      context,
                      text: onBoardingList[i].body!,
                      style: font10White400W(
                        context,
                        size: size_15(context),
                      ),
                      color: AppColors.backgroundColor,
                    ),
                    const SizedBox(height: 10),
                    CustomDotControllerOnBoarding(),
                    const SizedBox(height: 10),
                    CustomButtonOnBoarding(
                      onPressed: () {
                        provider.next(context);
                      },
                      text: MainAppConstants.next,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
