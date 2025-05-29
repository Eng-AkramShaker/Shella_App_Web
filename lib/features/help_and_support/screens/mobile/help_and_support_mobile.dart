import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/features/help_and_support/widgets/address_container.dart';
import 'package:shella_design/features/help_and_support/widgets/contact_us_container.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../../widgets/email_us_container.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(
        context,
        title: 'المساعدة و الدعم',
        img: 'assets/images/help_and_support_appbar_img.png',
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            children: [
              Image.asset('assets/images/site_support_12 1.png'),
              AddressContainer(),
              SizedBox(
                height: 20.h,
              ),
              ContactUsContainer(),
              SizedBox(
                height: 20.h,
              ),
              EmailUsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
