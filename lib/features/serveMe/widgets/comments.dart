import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class Comments extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const Comments({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    final serveMeController = Provider.of<ServeMeController>(context);
    return DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        dashPattern: [4, 4],
        color: AppColors.bgColor,
        strokeWidth: 1,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(serveMeController.focusNode),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.gryColor_8,
            ),
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              focusNode: serveMeController.focusNode,
              decoration: InputDecoration.collapsed(hintText: hintText, hintStyle: font10Grey400W(context, size: size_14(context))),
              maxLines: 5,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ));
  }
}
