import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_images.dart';

class OrderTrackingController with ChangeNotifier {
  int currentStage = 1;
  String deliveryTime = "في الوقت المحدد";
  String expectedTime1 = "8.50 م";
  String expectedTime2 = "9:50 م";
  String realTime1 = "8.50 م";
  String realTime2 = "9:50 م";
  String deliveryImage = AppImages.deliveryMan;
  String deliveryName = "Ahmed Kareem Nour";
  String deliveryCar = "سيارة 75887 R";
  String orderImage = AppImages.item_10;
  String storeImage = AppImages.item_12;
  String storeName = "بيتزا هت";
  int orderPrice = 130;
  String payType = "Apple pay";
  int itemCont = 2;
  String storeRouts = "";

  void nextStage() {
    if (currentStage < 5) {
      currentStage++;
      notifyListeners();
    }
  }

  bool get isCompleted => currentStage >= 5;
}
