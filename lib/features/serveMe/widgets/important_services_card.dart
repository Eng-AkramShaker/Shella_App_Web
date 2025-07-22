import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';

class ImprtantServicesCard extends StatelessWidget {
  final String image;
  final String title;
  final String suptitle;
  final bool selected;
  const ImprtantServicesCard({
    super.key,
    required this.image,
    required this.title,
    required this.suptitle,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: selected ? AppColors.secondaryColor : AppColors.gryColor_3,
          width: 2.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.gryColor_8,
            radius: 30.r,
            child: custom_Images_asset(
              image: image,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(
                context,
                text: title,
                size: 14,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              Custom_Text(
                context,
                text: suptitle,
                size: 10,
                color: AppColors.darkGreyColor,
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.greenColor,
              size: 25.r,
            ),
          ),
        ],
      ),
    );
  }
}
