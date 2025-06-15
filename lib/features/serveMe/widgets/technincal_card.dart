import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart'; // assuming this is what you're using

class TechnincalCard extends StatelessWidget {
  const TechnincalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 3.r,
        //     offset: Offset(0, 2.h),
        //   )
        // ],
      ),
      child: Row(
        children: [
          // Profile image
          CircleAvatar(
            radius: 24.r,
            backgroundImage: AssetImage(
              'assets/images/Pexels Photo by Italo Melo.png',
            ), // Replace with NetworkImage or Asset
          ),
          SizedBox(width: 12.w),

          // Info column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Custom_Text(
                      context,
                      text: 'احمد محمد',
                      style: font12Black400W(context),
                    ),
                    SizedBox(width: 10.w),
                    Row(
                      children: [
                        Custom_Text(
                          context,
                          text: 'يبدأ سعر الخدمة ',
                          style: font11Grey400W(context),
                        ),
                        Custom_Text(
                          context,
                          text: '300 ريال',
                          style: font12Green400W(context),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),
                        SizedBox(width: 4.w),
                        Custom_Text(
                          context,
                          text: '4.7',
                          style: font12Grey400W(context),
                        ),
                      ],
                    ),
                    SizedBox(width: 25.w),
                    Custom_Text(
                      context,
                      text: 'خبرة 8 سنوات',
                      style: font12SecondaryColor400W(context),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Rating and icons
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      pushNewScreen(context, AppRoutes.technicianDetailsScreen);
                    },
                    icon: Icon(Icons.check, color: Colors.green, size: 20.sp),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.close, color: Colors.black, size: 20.sp),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
