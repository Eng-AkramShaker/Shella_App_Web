import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/serveMe/widgets/booking_information.dart';
import 'package:shella_design/features/serveMe/widgets/comments.dart';
import 'package:shella_design/features/serveMe/widgets/evaluation.dart';
import 'package:shella_design/features/serveMe/widgets/technical_info.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

class ReviewOfAService extends StatelessWidget {
  const ReviewOfAService({super.key});

  @override
  Widget build(BuildContext context) {
    final serveMeController = Provider.of<ServeMeController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          SizedBox(
            height: 220,
            child: Evaluation(
              evaluationdegree: 3,
            ),
          ),
          Comments(
            controller: serveMeController.reviewcomments,
            hintText: "اكتب تعليقك هنا....",
          ),
          SizedBox(height: 40),
          BookingInformation(),
          SizedBox(height: 40),
          TechnicalInfo(
            color: AppColors.gryColor_8,
            isicon: false,
          ),
          SizedBox(height: 40),
          custom_Button(context,
              title: "ارسال تقييم",
              style: font10White400W(context, size: size_14(context)),
              onPressed: () {},
              h: 45),
          SizedBox(height: 20),
          custom_Button(context,
              title: "تخطي",
              border_color: AppColors.gryColor_8,
              buttoncolor: AppColors.gryColor_8,
              style: font12SecondaryColor400W(context, size: size_14(context)),
              onPressed: () {},
              h: 45),
          SizedBox(height: 40),
        ]),
      ),
    );
  }
}
