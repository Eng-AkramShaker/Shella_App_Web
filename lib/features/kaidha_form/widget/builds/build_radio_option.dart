import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildRadioOption({
  required BuildContext context,
  required IconData icon,
  required String mainlabel,
  required String seclabel,
  required String value,
  required String? groupValue,
  required Function(String?) onChanged,
}) {
  return Container(
    height: 75,
    decoration: BoxDecoration(border: Border.all(color: AppColors.gryColor_3), borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
              child: Container(
            height: 48,
            width: 48,
            color: AppColors.greenColor,
            child: Icon(
              icon,
              size: 24,
              color: AppColors.backgroundColor,
            ),
          )),
          Spacer(flex: 1),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(
                context,
                text: mainlabel,
                style: font11Black400W(context, size: size_16(context)),
              ),
              Custom_Text(
                context,
                text: seclabel,
                style: font10Grey400W(context, size: size_12(context)),
              ),
            ],
          ),
          Spacer(flex: 4),
          RadioTheme(
            data: RadioThemeData(
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.greenColor;
                }
                return AppColors.gryColor_3;
              }),
            ),
            child: Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    ),
  );
}
