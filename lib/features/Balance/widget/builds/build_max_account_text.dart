import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildMaxAmountText(BuildContext context) {
  return Custom_Text(
    context,
    text: 'الحد الأقصى 1000.00 ر.س',
    style: font11Grey400W(context, size: size_12(context)),
  );
}
