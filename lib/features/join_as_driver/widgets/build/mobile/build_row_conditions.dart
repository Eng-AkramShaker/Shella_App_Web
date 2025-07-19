import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

Widget buildRowCOnditions (BuildContext context,{required bool? value,required void Function(bool?)? onChanged}){
  return Row(
                children: [
                  Checkbox(
                      value: value,
                      checkColor: AppColors.backgroundColor,
                      activeColor: AppColors.greenColor,
                      onChanged: onChanged,
                      ),
                  Custom_Text(context,
                      text: MainAppConstants.iAcceptTermsCondition,
                      style: font11Grey400W(context))
                ],
              );
}