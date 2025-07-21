import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/helper/responsive_helper.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

import '../textField/custom_textfield_2.dart';

class CouponInputDialog extends StatefulWidget {
  const CouponInputDialog({super.key});

  @override
  _CouponInputDialogState createState() => _CouponInputDialogState();
}

class _CouponInputDialogState extends State<CouponInputDialog> {
  final _couponCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildDialogContent(context);
  }

  Widget _buildDialogContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: ResponsiveLayout.isWeb()
              ? MediaQuery.of(context).size.width / 3
              : MediaQuery.of(context).size.width, // Take full screen width
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: ResponsiveLayout.isWeb()
                  ? BorderRadius.circular(8.r)
                  : BorderRadius.circular(0.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(context,
                  text: 'اضف رمز القسيمة الجديدة',
                  style: font14Black400W(context)),
              SizedBox(height: 10.h),
              Custom_Text(context,
                  text: 'رمز القسمية', style: font14Black400W(context)),
              SizedBox(height: 10.h),
              CustomTextField(
                labelText: 'رمز القسيمة',
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: custom_Button(context,
                        title: 'إضافة',
                        onPressed: () {},
                        buttoncolor: AppColors.greenColor,
                        h: 40.h,
                        style: font13White400W(context)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: custom_Button(context, title: 'إلغاء',
                        onPressed: () {
                      Navigator.pop(context);
                    },
                        buttoncolor: AppColors.wtColor,
                        h: 40.h,
                        style: font13Black400W(context)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _couponCodeController.dispose();
    super.dispose();
  }
}
