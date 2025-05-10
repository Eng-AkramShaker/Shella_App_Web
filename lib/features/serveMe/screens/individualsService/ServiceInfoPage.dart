import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/edit_contact_information.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/info_of_service.dart';
import 'package:shella_design/features/serveMe/widgets/greenAppBar.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_styles.dart';

class ServiceInfoPage extends StatelessWidget {
  final String name;
  final String image;
  const ServiceInfoPage({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: greenAppBar(
          context,
          'معلومات الخدمة',
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildServiceLocationRow(context),
              SizedBox(height: 12.h),
              _buildAddressCard(context),
              SizedBox(height: 16.h),
              Center(child: _buildAddNewAddressButton(context)),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Custom_Text(
                    context,
                    text: 'ضع صوره او فيديو للمشكله',
                    style: font14Black400W(context),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              _buildImagePlaceholder(),
              SizedBox(height: 16.h),
              _buildProblemDescriptionField(),
              SizedBox(height: 20.h),
              _buildPriceInfoCard(context),
              SizedBox(height: 12.h),
              _buildPriceSelector(context),
              SizedBox(height: 30.h),
              _buildContinueButton(
                context,
                name,
                image,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceLocationRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(
          context,
          text: 'موقع طالب الخدمة',
          style: font12Black300W(context),
        ),
        Custom_Text(
          context,
          text: '+ اضف جديد',
          style: font12Green300W(context),
        ),
      ],
    );
  }

  Widget _buildAddressCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.home, color: Colors.green, size: 24.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(
                  context,
                  text: 'المنزل',
                  style: font12Black400W(context),
                ),
                Custom_Text(
                  context,
                  text: 'السعودية، الرياض 55552333',
                  style: font12Grey400W(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddNewAddressButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.orange),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const EditContactInformation(),
        );
      },
      child: Text('أضف عنوان جديد',
          style: TextStyle(color: Colors.orange, fontSize: 14.sp)),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Icon(Icons.image, size: 40.sp, color: Colors.grey),
      ),
    );
  }

  Widget _buildProblemDescriptionField() {
    return DottedBorder(
      radius: Radius.circular(15.r),
      borderType: BorderType.RRect,
      color: Colors.grey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          maxLines: 5,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'اشرح مشكلتك',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceInfoCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svg/si_wallet-fill.svg',
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(
                  context,
                  text: 'يبدأ من 150 ريال',
                  style: font14Black400W(context),
                ),
                Custom_Text(
                  context,
                  text: 'السعر يشمل الكشف والمعاينة',
                  style: font12Black300W(context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPriceSelector(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(
          context,
          text: 'ضع السعر المناسب',
          size: 12,
          color: Colors.red[900],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.red[900],
              ),
            ),
            Custom_Text(
              context,
              text: '300',
              style: font14Green400W(context),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove,
                color: Colors.red[900],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
    String name,
    String image,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // pushNewScreen(context, AppRoutes.infoOfService,arguments: );
          // Navigator.pushNamed(context, route, arguments: arguments);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoOfService(name: name, image: image),
              ));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        child: Custom_Text(
          context,
          text: 'حفظ ومتابعة',
          style: font12White500W(context),
        ),
      ),
    );
  }
}
