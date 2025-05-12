import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_colors.dart';
import '../../util/app_styles.dart';
import '../texts/custom_text.dart';

class DropChoice extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  final String titleChoiceOne;
  final TextStyle titleChoiceStyle;
  final String titleChoiceTwo;
  final double height;
  final double width;
  final Color? titleBackgroundColor;
  const DropChoice({
    super.key,
    required this.title,
    required this.titleChoiceOne,
    required this.titleChoiceTwo,
    required this.height,
    required this.width,
    this.titleBackgroundColor,
    required this.titleStyle,
    required this.titleChoiceStyle,
  });

  @override
  State<DropChoice> createState() => _DropChoiceState();
}

class _DropChoiceState extends State<DropChoice> {
  String? _selectedWorkType;
  bool hide = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              hide = !hide;
            });
          },
          child: Container(
            width: widget.width.w,
            height: widget.height.h,
            decoration:
                BoxDecoration(color: (widget.titleBackgroundColor) ?? AppColors.gryColor_5, borderRadius: BorderRadius.circular(6.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  Custom_Text(context, text: widget.title, style: (widget.titleStyle) ?? font10Black600W(context)),
                  Spacer(),
                  Icon(
                    !hide ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
                  ),
                ],
              ),
            ),
          ),
        ),
        hide
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildWorkTypeTile(widget.titleChoiceOne, 'independent'), // Independent in Arabic
                  SizedBox(
                    height: 1.h,
                  ),
                  _buildWorkTypeTile(widget.titleChoiceTwo, 'salary'), // Salary in Arabic
                ],
              )
      ],
    );
  }

  Widget _buildWorkTypeTile(String title, String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedWorkType = value;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            border: Border(bottom: BorderSide(color: AppColors.gryColor_5.withOpacity(.5), width: 1))),
        child: Row(
          children: <Widget>[
            Radio(
              value: value,
              groupValue: _selectedWorkType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedWorkType = newValue;
                });
              },
              activeColor: Colors.green, // Active radio button color
            ),
            Text(title, style: widget.titleChoiceStyle),
          ],
        ),
      ),
    );
  }
}
