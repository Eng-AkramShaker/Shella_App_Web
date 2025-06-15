// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/buttons/bottom_bar_widget.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/product/domain/models/store_details_model.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  TextEditingController notesController = TextEditingController();
  String? selectedSpice;
  String? selectedDrink;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 250.h,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  p.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: Colors.grey),
                ),
                Container(color: Colors.black26),
                Positioned(
                  top: 40,
                  left: 16,
                  child: BackButton(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(
                    context,
                    text: p.name,
                    style: font18Black600W(context),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(height: 8.h),
                  Custom_Text(
                    context,
                    text: '${p.price} ريال',
                    style: font14Grey500W(context),
                  ),
                  SizedBox(height: 16.h),
                  Custom_Text(
                    context,
                    text: "ملاحظات إضافية",
                    style: font14Black600W(context),
                  ),
                  SizedBox(height: 10.h),
                  _buildNotesInput(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }
}
