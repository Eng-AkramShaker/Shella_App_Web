import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/onboarding/controller/onboarding_controller.dart';
import 'package:shella_design/features/onboarding/widget/customslider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingProvider(),
      child: Scaffold(body: CustomSliderOnBoarding()),
    );
  }
}
