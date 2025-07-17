import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildRadioOptionTwo({
  required BuildContext context,
  required String label,
  required String value,
  required String? groupValue,
  required Function(String?) onChanged,
}) {
  return Row(
    children: [
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
      Custom_Text(
        context,
        text: label,
        style: font11Black500W(context, size: size_14(context)),
      )
    ],
  );
}
