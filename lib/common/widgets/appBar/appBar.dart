// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_styles.dart';

import '../texts/custom_text.dart';

PreferredSize custom_AppBar(
    BuildContext context, String? title, IconData icon, IconData titleIcon) {
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
                  Custom_Text(context,
                      text: " $title ", style: font14White600W(context)),
                  const SizedBox(width: 10),
                  Icon(titleIcon, color: Colors.white, size: 22),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 15,
            child: IconButton(
              icon: Icon(icon, color: AppColors.wtColor, size: 26),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    ),
  );
}
