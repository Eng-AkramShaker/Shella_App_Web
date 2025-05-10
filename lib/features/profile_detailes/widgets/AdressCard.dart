import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/util/app_colors.dart';

class AdressCard extends StatelessWidget {
  final Address address;
  const AdressCard({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.home,
                color: AppColors.greenColor,
                size: 35.r,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(
                      context,
                      text: address.addressType,
                      size: 18,
                    ),
                    Custom_Text(
                      context,
                      text: address.address,
                      size: 16,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.mode_edit_outlined,
                    color: AppColors.greenColor,
                    size: 30.r,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.greenColor,
                    size: 30.r,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
