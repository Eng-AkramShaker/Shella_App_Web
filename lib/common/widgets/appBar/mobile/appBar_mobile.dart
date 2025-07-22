// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../../texts/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSize custom_AppBar(
  BuildContext context, {
  required String? title,
  IconData? icon,
  String? img_icon, // مسار صورة SVG أو PNG
  IconData? titleIcon, // إذا لم توجد صورة
  Function()? onPressed,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: AppBar(
      backgroundColor: Colors.green,
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
                  Custom_Text(
                    context,
                    text: " $title ",
                    style: font14White600W(context),
                  ),
                  const SizedBox(width: 10),
                  if (img_icon != null && img_icon.isNotEmpty)
                    img_icon.endsWith('.svg')
                        ? SvgPicture.asset(
                            img_icon,
                            height: 20,
                            width: 20,
                            color: Theme.of(context).cardColor,
                          )
                        : Image.asset(
                            img_icon,
                            height: 20,
                            width: 20,
                            color: Theme.of(context).cardColor,
                          )
                  else if (titleIcon != null)
                    Icon(
                      titleIcon,
                      color: Theme.of(context).cardColor,
                      size: 22,
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 15,
            child: IconButton(
              icon: Icon(icon, color: AppColors.wtColor, size: 26),
              onPressed: onPressed ?? () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    ),
  );
}
