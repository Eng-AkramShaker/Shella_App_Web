import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/serveMe/widgets/greenAppBar.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

class TechnicianDetailsScreen extends StatelessWidget {
  const TechnicianDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: greenAppBar(
        context,
        'الفنيين المتاحين',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            // Technician Card
            Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundImage: AssetImage(
                      'assets/images/Pexels Photo by Italo Melo.png',
                    ), // Replace with NetworkImage or Asset
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(context,
                            text: 'احمد محمد', style: font14Black600W(context)),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16.sp),
                            SizedBox(width: 4.w),
                            Custom_Text(context,
                                text: '4.7', style: font12Grey400W(context)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Custom_Text(context,
                      text: 'خبرة 8 سنوات',
                      style: font12SecondaryColor400W(context)),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Price Card
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3.r)],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/si_wallet-fill.svg',
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Custom_Text(context,
                              text: 'يبدأ من ',
                              style: font14Black500W(context)),
                          Custom_Text(context,
                              text: '90 ريال', style: font14Green500W(context)),
                        ],
                      ),
                      Custom_Text(context,
                          text: 'السعر يشمل الكشف والمعاينة',
                          style: font12Grey400W(context)),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Customer Reviews Title
            Custom_Text(context,
                text: 'آراء العملاء', style: font14SecondaryColor500W(context)),

            SizedBox(height: 8.h),

            // Customer Review List
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24.r,
                            backgroundImage: AssetImage(
                              'assets/images/Pexels Photo by Italo Melo.png',
                            ), // Replace with NetworkImage or Asset
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Custom_Text(context,
                                  text: 'محمد خالد',
                                  style: font14Black500W(context)),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 16.sp),
                                  SizedBox(width: 4.w),
                                  Custom_Text(context,
                                      text: '4.7',
                                      style: font12Grey400W(context)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsets.symmetric(vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            Custom_Text(context,
                                text: 'راجل امين و شغله حلو',
                                style: font13Black400W(context)),
                          ],
                        ),
                      ),
                      SizedBox(height: 6.h),
                    ],
                  );
                },
              ),
            ),

            // Booking Time Section
            Custom_Text(context,
                text: 'حدد وقت الحجز', style: font14Black500W(context)),
            SizedBox(height: 12.h),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors.green, // clock hand & OK button
                                onPrimary: Colors.white, // selected time text
                                onSurface: Colors.black, // general text
                              ),
                              datePickerTheme: DatePickerThemeData(
                                backgroundColor: Colors.green[50],
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time, color: Colors.green),
                              SizedBox(width: 4.w),
                              Custom_Text(context,
                                  text: 'الوقت',
                                  style: font12Grey400W(context)),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Custom_Text(context,
                              text: '9:00', style: font14Black500W(context)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate:
                            DateTime.now(), // can be set to any past/future
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Colors
                                    .green, // header background & OK button
                                onPrimary: Colors.white, // header text color
                                onSurface: Colors.black, // body text color
                              ),
                              datePickerTheme: DatePickerThemeData(
                                backgroundColor: Colors.green[50],
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month, color: Colors.green),
                              SizedBox(width: 4.w),
                              Custom_Text(context,
                                  text: 'التاريخ',
                                  style: font12Grey400W(context)),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Custom_Text(context,
                              text: '25 فبراير',
                              style: font14Black500W(context)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                onPressed: () {
                  pushNewScreen(context, AppRoutes.confirmReservation);
                },
                child: Custom_Text(
                  context,
                  text: 'حفظ ومتابعة',
                  style: font14White600W(context),
                ),
              ),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
