import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/profile_detailes/controllers/custome_info_controller.dart';
import 'package:shella_design/features/profile_detailes/widgets/formate_date_info.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_info_list.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<CustomerController>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final customer = provider.customer;
          if (customer == null) {
            return const Center(child: Text("لا توجد بيانات")); 
          }
          final items = [
            {'title': 'الاسم بالكامل', 'value': customer.fullName},
            {'title': 'رقم الهاتف', 'value': customer.phone},
            {'title': 'تاريخ الميلاد', 'value': formatDate(customer.createdAt)},
            {'title': 'البريد الإلكتروني', 'value': customer.email},
            {'title': 'كلمة المرور', 'value': '***********'},
          ];
          return profile_info_list(items: items);
        },
      ),
    );
  }
}






