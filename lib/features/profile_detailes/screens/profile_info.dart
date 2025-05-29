import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_info_button.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_info_list.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'الاسم بالكامل', 'value': 'نورا احمد'},
      {'title': 'رقم الهاتف', 'value': '0096266544884'},
      {'title': 'تاريخ الميلاد', 'value': '12/12/1990'},
      {'title': 'البريد الإلكتروني', 'value': 'Mailto@mailto.com'},
      {'title': 'كلمة المرور', 'value': '***********'},
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Text(
          'معلومات الحساب',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Expanded(
            child: profile_info_list(items: items),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: profile_info_button()),
        ],
      ),
    );
  }
}



