import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpActionsRow extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSubmit;

  const OtpActionsRow({
    Key? key,
    required this.onClose,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey.shade300, width: 1.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            minimumSize: Size(100.w, 40.h),
          ),
          onPressed: onClose,
          child: Text('إغلاق',
              style: TextStyle(fontSize: 14.sp, color: Colors.black)),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.orange.shade400, width: 2.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            minimumSize: Size(100.w, 40.h),
          ),
          onPressed: onSubmit,
          child: Text('ارسال',
              style: TextStyle(fontSize: 14.sp, color: Colors.black)),
        ),
      ],
    );
  }
}
