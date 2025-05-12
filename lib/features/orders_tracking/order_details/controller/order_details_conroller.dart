import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_images.dart';

class OrderDetailsConroller with ChangeNotifier {
  String orderID = "#100250";
  String orderDate = "Dec 2024  12:42:2";
  String minimumTime = "PM 3:44";
  String maxmumTime = "PM 4:44";
  int deliveryCode = 4656;
  String requestType = "توصيل";
  String paymentMethod = "نقدآ عند التسليم";
  String orderStatus = "قيد الموافقه";
  int itemCont = 2;
  List<String> itemImage = [AppImages.item_10, AppImages.item_11];
}
