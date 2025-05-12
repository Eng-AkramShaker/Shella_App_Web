// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/cart/widgets/builds/build_button.dart';
import 'package:shella_design/features/cart/widgets/builds/build_notes_input.dart';
import 'package:shella_design/features/cart/widgets/custom_rich_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/cart/widgets/bottom_bar_CartDetails.dart';
import 'package:shella_design/features/cart/widgets/header_details.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class CartDetailsScreen extends StatefulWidget {
  const CartDetailsScreen({super.key});

  @override
  _CartDetailsScreenState createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader_Cart_details(context, img: AppImages.item_25),

            //
            SizedBox(height: 8.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(context, text: "نسكافيه 3*1", style: font14Black600W(context, lineHeight: 3)),

                  CustomRichText(),

                  SizedBox(height: 8.h),

                  Custom_Text(context, text: "50 ريال", style: font14SecondaryColor500W(context)),

                  SizedBox(height: 16.h),

                  Custom_Text(context, text: "ملاحظات إضافية", style: font14Black600W(context)),

                  SizedBox(height: 10.h),
                  buildNotesInput(context, notesController),
                  SizedBox(height: 20.h),
                  buildButton(context),
                  SizedBox(height: 50),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar_CartDetails(),
    );
  }
}
