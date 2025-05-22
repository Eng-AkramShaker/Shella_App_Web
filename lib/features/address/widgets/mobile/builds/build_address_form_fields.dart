import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/features/address/widgets/mobile/text_field.dart';
import 'package:shella_design/common/util/app_colors.dart';

Widget buildAddressFormFields({
  required BuildContext context,
  required TextEditingController addressController,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required TextEditingController streetController,
  required TextEditingController floorController,
  required TextEditingController houseController,
  String? addressError,
  String? nameError,
  String? phoneError,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Address TextField
      textField(
        label: 'عنوان التسليم',
        hint: 'أدخل عنوان التسليم',
        controller: addressController,
      ),
      if (addressError != null)
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Text(
            addressError,
            style: TextStyle(color: Colors.red, fontSize: 12.sp),
          ),
        ),
      SizedBox(height: 16.h),

      // Contact Name TextField
      textField(
        label: 'اسم المتصل',
        hint: 'أدخل اسم المتصل',
        controller: nameController,
      ),
      if (nameError != null)
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Text(
            nameError,
            style: TextStyle(color: Colors.red, fontSize: 12.sp),
          ),
        ),
      SizedBox(height: 16.h),

      // Phone Number TextField
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'رقم الهاتف',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 48.h,
            child: CustomPhoneInput(
              controller: phoneController,
              errorText: phoneError,
              onChanged: (_) {}, // Add a simple empty function for onChanged
            ),
          ),
        ],
      ),
      SizedBox(height: 16.h),

      // Street TextField
      textField(
        label: 'الشارع',
        hint: 'أدخل اسم الشارع',
        controller: streetController,
      ),
      SizedBox(height: 16.h),

      // Floor & House TextFields (in a row)
      Row(
        children: [
          Expanded(
            child: textField(
              label: 'الطابق',
              hint: 'أدخل رقم الطابق',
              controller: floorController,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: textField(
              label: 'المنزل',
              hint: 'أدخل رقم المنزل',
              controller: houseController,
            ),
          ),
        ],
      ),
      SizedBox(height: 24.h),
    ],
  );
}
