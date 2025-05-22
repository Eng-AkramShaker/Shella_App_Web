import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/address/domain/models/address_model.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/util/app_styles.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final Function()? onEditPressed;
  final Function()? onDeletePressed;
  final Function()? onTap;
  final bool isSelected;

  const AddressCard({
    super.key,
    required this.address,
    this.onEditPressed,
    this.onDeletePressed,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Card(
          color: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color:
                  isSelected ? AppColors.secondaryColor : AppColors.gryColor_3,
              width: isSelected ? 1.5 : 1.0,
            ),
          ),
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/home-icon.svg',
                  height: 22.h,
                  width: 22.w,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(
                        context,
                        text: address.addressType,
                        size: 16,
                        style: font11Black500W(context),
                      ),
                      SizedBox(height: 2.h),
                      Custom_Text(
                        context,
                        text: address.address,
                        size: 14,
                        color: AppColors.gryColor_2,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onEditPressed,
                      child: SvgPicture.asset(
                        'assets/svg/edit-icon.svg',
                        height: 15.h,
                        width: 15.w,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    GestureDetector(
                      onTap: onDeletePressed,
                      child: SvgPicture.asset(
                        'assets/svg/delete-icon.svg',
                        height: 15.h,
                        width: 15.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
