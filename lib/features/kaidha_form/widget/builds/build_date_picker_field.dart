import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/kaidha_form/widget/builds/build_select_date.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

Widget buildDatePickerField(BuildContext context) {
  final kaidhaFormController = context.watch<KaidhaFormController>();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Custom_Text(
        context,
        text: "تاريخ الميلاد",
        style: font11Black500W(context, size: size_14(context)),
      ),
      SizedBox(height: 10),
      TextFormField(
        controller: TextEditingController(text: kaidhaFormController.birthDate),
        readOnly: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.gryColor_3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.greenColor),
          ),
          suffixIcon: Icon(Icons.calendar_today, color: AppColors.gryColor_3),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'YYYY-MM-DD',
        ),
        onTap: () => selectDate(context),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'الرجاء اختيار تاريخ الميلاد';
          }
          return null;
        },
      ),
    ],
  );
}
