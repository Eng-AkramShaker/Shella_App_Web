import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/address/controllers/address_controller.dart';
import 'package:shella_design/features/address/widgets/mobile/selectable_button.dart';

Widget buildAddressTypeButtons(BuildContext context) {
  return Consumer<AddressController>(
    builder: (context, controller, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'نوع العنوان',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: _buildAddressTypeButton(
                  context,
                  controller,
                  'منزل',
                  1,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildAddressTypeButton(
                  context,
                  controller,
                  'عمل',
                  2,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildAddressTypeButton(
                  context,
                  controller,
                  'أخرى',
                  3,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget _buildAddressTypeButton(
  BuildContext context,
  AddressController controller,
  String label,
  int value,
) {
  return GestureDetector(
    onTap: () => controller.updateAddressType(value),
    child: Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: controller.addressType == value
            ? AppColors.secondaryColor
            : Colors.transparent,
        border: Border.all(
          color: controller.addressType == value
              ? AppColors.secondaryColor
              : AppColors.gryColor_3,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color:
                controller.addressType == value ? Colors.white : Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
