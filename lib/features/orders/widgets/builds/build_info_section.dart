import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/orders/widgets/builds/build_double_text_field.dart';
import 'package:shella_design/features/orders/widgets/builds/build_header.dart';
import 'package:shella_design/features/orders/widgets/builds/build_location_card.dart';
import 'package:shella_design/features/orders/widgets/builds/build_phone_field.dart';
import 'package:shella_design/features/orders/widgets/builds/build_service_card.dart';
import 'package:shella_design/features/orders/widgets/builds/build_text_field_orders.dart';
import 'package:shella_design/features/orders/widgets/builds/build_title_order.dart';

Widget buildInfoSection(BuildContext context, TextEditingController notesController, TextEditingController phoneController) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          buildHeader("موقع الالتقاط", "اضف جديد", Icons.add, context),
          buildServiceCard("تفاصيل الخدمة المراد نقلها", Icons.add, context),
          buildLocationCard(context),
          buildTitle("وضح عنوانك", context),
          buildTextField("اسم الشارع", context, notesController),
          buildTextField("اسم المنطقة", context, notesController),
          buildDoubleTextField("المنزل", "أرضية", notesController),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTitle("معلومات المرسل", context),
            ],
          ),
          buildTextField("اسم المرسل", context, notesController),
          buildPhoneField(context, phoneController),
          SizedBox(height: 50.h),
        ],
      ),
    ),
  );
}
