import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/serveMe/widgets/greenAppBar.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_navigators.dart';

class Companiesservicespage extends StatelessWidget {
  const Companiesservicespage({super.key});

  @override
  Widget build(BuildContext context) {
    // List data = [];
    return Scaffold(
      appBar: greenAppBar(
        context,
        'خدمات الشركات',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Custom_Text(context,
                text: 'اختر نوع الخدمات التي ترغب  في شرائها',
                size: 14,
                color: Colors.black),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      pushNewScreen(context, AppRoutes.companiesWorkshopsPage1);
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: AppColors.greenColor,
                              width: 2.w,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 5.h,
                            ),
                            child: Image.asset(
                                'assets/images/pngtree-a-bag-of-home-tool-kits-ai-generative-png-image_11555782 1.png'),
                          ),
                        ),
                        SizedBox(height: 10),
                        Custom_Text(
                          context,
                          text: ' خدمات الشركات', // Example text
                          size: 12,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
