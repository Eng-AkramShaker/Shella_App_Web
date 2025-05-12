import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsContainer extends StatelessWidget {
  const ContactUsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String phoneNumber = '+15551234567'; // Replace with the actual phone number
        String url = 'tel:$phoneNumber';
        await launchUrl(Uri.parse(url));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
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
                    Icons.call_outlined,
                    color: AppColors.greenColor,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(
                    context,
                    text: 'اتصل بنا',
                    style: font12Green400W(context),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Custom_Text(
                    context,
                    text: '+966-5999-777-25',
                    style: font12Black300W(context),
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
