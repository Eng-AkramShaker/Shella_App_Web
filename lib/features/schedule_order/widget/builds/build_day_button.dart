import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildDayButton(BuildContext context, String day, String selectedDay, ValueChanged<String> onDaySelected) => GestureDetector(
      onTap: () => onDaySelected(day),
      child: Text(day,
          style: selectedDay == day
              ? font13Green500W(context, size: size_14(context))
              : font11Black500W(context, size: size_14(context))),
    );
