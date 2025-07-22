// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/Auth/widgets/web/otp_action_row_web.dart';
import 'package:shella_design/features/Auth/widgets/web/otp_fields_web.dart';
import 'package:shella_design/features/Auth/widgets/web/otp_header_web.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_icons.dart';
import 'package:shella_design/common/util/svg_icon_widget.dart';

class BodyOtp extends StatefulWidget {
  const BodyOtp({super.key});
  static const _codeLength = 5;

  @override
  State<BodyOtp> createState() => _BodyOtpState();
}

class _BodyOtpState extends State<BodyOtp> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(BodyOtp._codeLength, (_) => TextEditingController());
    _focusNodes = List.generate(BodyOtp._codeLength, (_) => FocusNode());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes.first.requestFocus();
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onCodeChanged(String val, int idx) {
    if (val.isNotEmpty && idx + 1 < BodyOtp._codeLength) {
      _focusNodes[idx + 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.r,
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Container(
        width: 750.w,
        height: 360.h,
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            OtpHeader(onBack: () => Navigator.of(context).pop()),

            SizedBox(height: 8.h),
            Divider(height: 1.h, color: Colors.grey.shade300),
            SizedBox(height: 24.h),

            SizedBox(
              width: 330.w,
              child: Text(
                'تم ارسال الرمز الى الرقم +9662254448888',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),
            ),

            SizedBox(height: 24.h),

            OtpFields(
              length: BodyOtp._codeLength,
              controllers: _controllers,
              focusNodes: _focusNodes,
              onChanged: _onCodeChanged,
            ),

            SizedBox(height: 16.h),

            // 4) Refresh icon
            IconButton(
              icon: SvgIcon(iconTitle: AppIcons.refresh),
              onPressed: () {},
            ),

            SizedBox(height: 8.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'إعادة ارسال رمز التأكيد',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),

            SizedBox(height: 8.h),

            OtpActionsRow(
              onClose: () => Navigator.of(context).pop(),
              onSubmit: () {},
            ),
          ],
        ),
      ),
    );
  }
}
