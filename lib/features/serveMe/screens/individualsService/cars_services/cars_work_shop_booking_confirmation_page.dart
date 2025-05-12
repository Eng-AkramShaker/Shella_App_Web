import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/cars_services/cars_booking_confirmation_success.dart';
import 'package:shella_design/features/serveMe/widgets/greenAppBar.dart';
import 'package:shella_design/common/util/app_colors.dart';

class CarsWorkShopBookingConfirmationPage extends StatelessWidget {
  const CarsWorkShopBookingConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: greenAppBar(
        context,
        'تأكيد الحجز',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  'assets/images/FRAME (25) 1.png', // Replace with your image path
                  width: double.infinity,
                  height: 180.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custom_Text(
                    context,
                    text: 'ورشة الامان للسيارات',
                    size: 16,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Custom_Text(
                        context,
                        text: '4.7',
                        size: 14,
                        color: Colors.black,
                      ),
                      Row(
                        children: List.generate(4, (index) {
                          return Icon(Icons.star, color: Colors.amber, size: 20.sp);
                        })
                          ..insert(0, Icon(Icons.star_half, color: Colors.amber, size: 20.sp)),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(height: 30.h),
              Custom_Text(
                context,
                text: 'تفاصيل الحجز',
                size: 16,
                color: Colors.green,
              ),
              SizedBox(height: 16.h),
              Custom_Text(context, text: 'تفاصيل السيارة', size: 14, color: Colors.black),
              _buildInfoTile(context, Icons.directions_car, 'تويوتا كامري'),
              SizedBox(height: 12.h),
              Custom_Text(context, text: 'نوع الخدمة', size: 14, color: Colors.black),
              _buildInfoTile(context, Icons.build, 'صيانة دورية'),
              SizedBox(height: 12.h),
              Custom_Text(context, text: 'التاريخ', size: 14, color: Colors.black),
              _buildInfoTile(context, Icons.calendar_today, '15 فبراير 2025'),
              SizedBox(height: 12.h),
              Custom_Text(context, text: 'الوقت', size: 14, color: Colors.black),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  _timeButton(context, '4:30'),
                  _timeButton(context, '2:00'),
                  _timeButton(context, '11:30'),
                  _timeButton(context, '6:00', selected: true),
                ],
              ),
              SizedBox(height: 16.h),
              Custom_Text(context, text: 'الملاحظات (اختياري)', size: 14, color: Colors.black),
              SizedBox(height: 16.h),

              DottedBorder(
                borderPadding: EdgeInsets.all(0),
                borderType: BorderType.RRect,
                radius: Radius.circular(
                  15,
                ),
                child: CustomNotesField(
                  maxLines: 5,
                  elevation: 0,
                ),
              ),
              // Container(
              //   height: 120.h,
              //   padding: EdgeInsets.all(10.w),
              //   margin: EdgeInsets.symmetric(vertical: 10.h),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.circular(8.r),
              //   ),
              //   child: TextField(
              //     maxLines: null,
              //     decoration:
              //         InputDecoration.collapsed(hintText: 'اضف ملاحظاتك'),
              //   ),
              // ),
              SizedBox(height: 12.h),
              _priceRow(context, 'رسوم الخدمة', '150 ريال'),
              _priceRow(context, 'رسوم إضافية', '25 ريال'),
              Divider(),
              _priceRow(context, 'الإجمالي', '175 ريال', total: true),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CarsBookingConfirmationSuccess(),
                    ));
                  },
                  child: Custom_Text(context, text: 'تأكيد الحجز', size: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(BuildContext context, IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 10.w),
          Custom_Text(context, text: text, size: 14, color: Colors.black),
        ],
      ),
    );
  }

  Widget _timeButton(BuildContext context, String time, {bool selected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: selected ? Border.all(color: Colors.transparent) : Border.all(color: Colors.grey),
      ),
      child: Custom_Text(
        context,
        text: time,
        size: 14,
        color: selected ? Colors.white : Colors.black,
      ),
    );
  }

  Widget _priceRow(BuildContext context, String label, String price, {bool total = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Custom_Text(context, text: label, size: 14, color: Colors.black),
          Custom_Text(
            context,
            text: price,
            size: 14,
            color: total ? Colors.green : Colors.black,
          ),
        ],
      ),
    );
  }
}
