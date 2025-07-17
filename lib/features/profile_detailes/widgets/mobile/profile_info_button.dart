import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';

class profile_info_button extends StatelessWidget {
  const profile_info_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenColor,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      onPressed: () {
        // TODO: تنفيذ حذف الحساب
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'حذف الحساب',
            style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(width: 10.w), 
          Icon(Icons.delete, size: 20.sp, color: Colors.white),
        ],
      ),
    );
  }
}
