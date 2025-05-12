// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/widgets/buttons/bottom_bar_widget.dart';
import 'package:shella_design/features/product/widgets/selection/custom_selection.dart';
import 'package:shella_design/features/product/widgets/header/header_details.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context),
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(context, text: "تيكا لحم", style: font14Black600W(context)),
                  SizedBox(height: 8.h),
                  Custom_Text(context, text: "لحم,خس ,مخلل,بصل,تو\nمايونيز,خبز فيينا.....", style: font14Grey500W(context)),

                  SizedBox(height: 8.h),

                  Custom_Text(context, text: "50 ريال", style: font14SecondaryColor500W(context)),

                  SizedBox(height: 16.h),

                  CustomSelection(
                    title: "مستوى التوابل",
                    options: ["عادية", "متوسطة", "حار"],
                    onSelected: (value) {},
                  ),

                  CustomSelection(
                    title: "اختر مشروبك",
                    options: ["بيبسي عادي", "بيبسي دايت", "سفن آب", "ميرندا برتقال", "ميرندا تفاح"],
                    onSelected: (value) {},
                  ),

                  SizedBox(height: 16.h),

                  Custom_Text(context, text: "ملاحظات إضافية", style: font14Black600W(context)),

                  SizedBox(height: 10.h),
                  _buildNotesInput(),
                  SizedBox(height: 20.h),
                  _buildButton(),
                  SizedBox(height: 50),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }

  Widget _buildNotesInput() {
    return Card(
      color: AppColors.backgroundColor,
      child: TextField(
        maxLines: 3,
        controller: notesController,
        decoration: InputDecoration(
          hintText: "أدخل ملاحظاتك (اختياري)",
          hintStyle: font11Grey400W(context),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(65.w, 65.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Custom_Text(context, text: "إدخال", style: font14White400W(context)),
        ),
      ],
    );
  }
//
}
