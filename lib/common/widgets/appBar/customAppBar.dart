// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

PreferredSize customAppBar(BuildContext context,
    {TextStyle? style,
    String? title,
    String? img,
    IconData? icon,
    Color? iconbackcolor,
    Color? backgroundColor,
    Function()? onPressed}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: AppBar(
      backgroundColor: backgroundColor ?? AppColors.greenColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 22,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 20),
                  Custom_Text(context,
                      text: " $title ",
                      style: style ?? font14White600W(context)),
                  const SizedBox(width: 10),
                  Image.asset(img ?? AppImages.empty,
                      width: 20, height: 18, alignment: Alignment.bottomCenter),
                  const SizedBox(width: 10),
                  Icon(icon, color: AppColors.wtColor, size: 22)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 15,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp,
                  color: iconbackcolor ?? AppColors.wtColor, size: 26),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    ),
  );
}
