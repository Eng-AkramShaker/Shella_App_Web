import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildSearchItem(BuildContext context, String text) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.search, size: 20),
                  const SizedBox(width: 10),
                  Custom_Text(
                    context,
                    text: text,
                    color: AppColors.bgColor,
                    style: font10Black300W(context, size: size_10(context)),
                  ),
                ],
              ),
              IconButtonCircle(onPressed: () {}, icon: Icons.close),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
