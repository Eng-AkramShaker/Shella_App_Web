import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shella_design/features/profile_detailes/widgets/mobile/profile_info_listTitle.dart';

import '../../../domain/models/customer_info_model.dart';
import '../profile_divider.dart';

Widget buildProfileInfoBody(BuildContext context, CustomerModel customer) {
  return ListView(
    padding: EdgeInsets.all(6.w),
    children: [
      buildProfileInfoItem(
        "الاسم الكامل",
        customer.fullName ?? "",
        context,
      ),
      ProfileDivider(),
      buildProfileInfoItem(
        "رقم الهاتف",
        customer.phone ?? "",
        context,
      ),
      ProfileDivider(),
      buildProfileInfoItem(
        "تاريخ الميلاد",
        "01/01/2000",
        context,
      ),
      ProfileDivider(),
      buildProfileInfoItem(
        "البريد الالكتروني",
        customer.email ?? "لا يوجد إيميل",
        context,
      ),
      ProfileDivider(),
      buildProfileInfoItem(
        "كلمة المرور",
        "********",
        context,
      ),
      ProfileDivider(),
    ],
  );
}