import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildPhoneField(BuildContext context, TextEditingController phoneController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Custom_Text(context, text: "رقم الهاتف", style: font14Green500W(context)),
      SizedBox(height: 10.h),
      CustomPhoneInput(controller: phoneController, onChanged: (number) {}),
    ],
  );
}
