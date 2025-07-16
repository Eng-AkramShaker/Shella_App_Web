import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/onboarding/controller/static.dart';
import 'package:shella_design/common/helper/app_routes.dart';

class OnBoardingProvider extends ChangeNotifier {
  late PageController pageController;
  int _currentPage = 0;

  int get currentPage => _currentPage;

  OnBoardingProvider() {
    pageController = PageController();
  }

  void next(BuildContext context) {
    _currentPage++;
    if (_currentPage > onBoardingList.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.onBoarding_end);
    } else {
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
