// ignore_for_file: deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/function/copy_to_clipboard.dart';
import 'package:shella_design/common/widgets/texts/text_button.dart';
import 'package:shella_design/features/return_and_earn/widgets/share_container.dart';
import 'package:shella_design/common/util/app_colors.dart';

import '../../../common/widgets/textField/custom_textfield_2.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../common/util/app_styles.dart';

class InviteFriendsTextAndPersonalCode extends StatefulWidget {
  const InviteFriendsTextAndPersonalCode({super.key});

  @override
  State<InviteFriendsTextAndPersonalCode> createState() => _InviteFriendsTextAndPersonalCodeState();
}

class _InviteFriendsTextAndPersonalCodeState extends State<InviteFriendsTextAndPersonalCode> {
  final TextEditingController _controller = TextEditingController(); // Controller for the text field

  @override
  void dispose() {
    _controller.dispose(); // Important: Dispose of the controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = '08BDOMJGZY';
    return Column(
      children: [
        Custom_Text(context, text: 'دعوة الاصدقاء والشركات', style: font14Black400W(context)),
        SizedBox(height: 5.h),
        Custom_Text(context, text: 'انسخ الرمز الخاص بك وشاركه مع اصدقائك', style: font13Grey400W(context)),
        SizedBox(height: 30.h),
        Custom_Text(context, text: 'الرمز الشخصي الخاص بك', style: font13Grey400W(context)),
        SizedBox(height: 10),
        DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1,
          dashPattern: [6, 3],
          color: AppColors.greenColor,
          radius: Radius.circular(30.r),
          child: CustomTextField(
            controller: _controller,
            readOnly: true,
            labelText: '',
            padding: 0,
            dottedBorder: true,
            suffixIcon: TextButtonWidget(
              onPressed: () => copyToClipboard(context, _controller),
              height: 50.h,
              text: 'ينسخ',
              backgroundColor: AppColors.greenColor,
              textStyle: font13White400W(context),
              radius: 30,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ShareContainer(controller: _controller)
      ],
    );
  }
}
