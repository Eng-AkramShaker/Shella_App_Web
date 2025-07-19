// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';

//  Size ========================================================
double size_4(BuildContext context) => sp(context, 4);
double size_5(BuildContext context) => sp(context, 5);
double size_6(BuildContext context) => sp(context, 6);
double size_8(BuildContext context) => sp(context, 8);
double size_9(BuildContext context) => sp(context, 9);

double size_10(BuildContext context) => sp(context, 10);
double size_11(BuildContext context) => sp(context, 11);

double size_12(BuildContext context) => sp(context, 12);
double size_13(BuildContext context) => sp(context, 13);
double size_14(BuildContext context) => sp(context, 14);
double size_15(BuildContext context) => sp(context, 15);
double size_16(BuildContext context) => sp(context, 16);
double size_18(BuildContext context) => sp(context, 18);
double size_20(BuildContext context) => sp(context, 20);
double size_21(BuildContext context) => sp(context, 21);
double size_22(BuildContext context) => sp(context, 22);
double size_24(BuildContext context) => sp(context, 24);

double sp(BuildContext context, double fontSize) {
  double scaleFactor = ResponsiveLayout.isWeb()
      ? MediaQuery.of(context).size.width / 1420
      : MediaQuery.of(context).size.width / 375;
  double heightFactor = ResponsiveLayout.isWeb()
      ? MediaQuery.of(context).size.width / 700
      : MediaQuery.of(context).size.height / 812;

  double responsiveFactor = (scaleFactor + heightFactor) / 2;

  return fontSize * responsiveFactor;
}

// =========================================================

double width_media(BuildContext context) {
  double reswidth = MediaQuery.sizeOf(context).width;
  return reswidth;
}

double height_media(BuildContext context) {
  double resheight = MediaQuery.sizeOf(context).height;
  return resheight;
}
