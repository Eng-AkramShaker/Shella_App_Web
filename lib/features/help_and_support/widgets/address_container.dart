import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=48.8584,2.2945'; // Eiffel Tower
        await launchUrl(Uri.parse(googleMapsUrl));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5), // Shadow color
              spreadRadius: 0, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Offset from the container
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0.sp),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.greenColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: AppColors.greenColor,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(
                    context,
                    text: 'عناويننا',
                    style: font12Green400W(context, size: 11),
                  ),
                  SizedBox(height: 10.h),
                  Custom_Text(
                    context,
                    text: 'ksa, saudi arabia , umm al hammam',
                    style: font12Black300W(context, size: 11),
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
