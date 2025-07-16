import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/common/util/app_colors.dart';

class AdressCard extends StatelessWidget {
  final Address address;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const AdressCard({
    super.key,
    required this.address,
    required this.onDelete,
    required this.onEdit,
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
                    Custom_Text(context,
                        text: "${address.address},${address.contactPersonNumber}", size: 14, color: AppColors.supListTitle),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.mode_edit_outline_rounded, size: 30.r),
                    color: AppColors.greenColor,
                    onPressed: onEdit,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline_rounded, size: 30.r),
                    color: AppColors.greenColor,
                    onPressed: onDelete,
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
