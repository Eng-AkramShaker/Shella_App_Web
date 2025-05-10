import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_styles.dart';
import '../../../common/widgets/appBar/customAppBar.dart';
import '../../../helper/app_routes.dart';
import '../../../util/app_navigators.dart';
import '../widgets/phone_and_email.dart';
import '../widgets/picture_and_full_name.dart';

class JoinAsDriverOne extends StatelessWidget {
  const JoinAsDriverOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, title: 'انضم كرجل توصيل', img: 'assets/images/join_as_driver_appbar_img.png'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PictureAndFullName(),
              SizedBox(
                height: 10.h,
              ),
              PhoneAndEmail(),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: double.infinity,
                height: 55.h,
                decoration: BoxDecoration(color: AppColors.greenColor, borderRadius: BorderRadius.circular(8.r)),
                child: Custom_Text_Button(
                  context,
                  text_style: font14White500W(context),
                  onPressed: () {
                    pushNewScreen(context, AppRoutes.joinAsDriverTwo);
                  },
                  text: 'التالي',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
