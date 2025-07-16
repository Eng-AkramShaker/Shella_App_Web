import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/onboarding/controller/onboarding_controller.dart';
import 'package:shella_design/features/onboarding/controller/static.dart';
import 'package:shella_design/common/util/app_colors.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context, provider, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          onBoardingList.length,
          (index) => Expanded(
            child: AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              duration: const Duration(milliseconds: 800),
              height: 6,
              decoration: BoxDecoration(
                color: provider.currentPage == index ? AppColors.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: AppColors.primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
