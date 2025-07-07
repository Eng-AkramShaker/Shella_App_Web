import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget customTextFormAuth({
  String? hintText,
  final bool isNumber = false,
  final bool? obscureText,
  final TextEditingController? mycontroller,
  required String text,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Custom_Text(context, text: text, style: font11Black500W(context, size: size_14(context))),
      SizedBox(height: 10),
      Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: TextFormField(
          keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
          cursorColor: AppColors.bgColor,
          controller: mycontroller,
          obscureText: obscureText == null || obscureText == false ? false : true,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: font10Grey500W(context, size: size_14(context)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gryColor_3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.greenColor),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
    ],
  );
}
