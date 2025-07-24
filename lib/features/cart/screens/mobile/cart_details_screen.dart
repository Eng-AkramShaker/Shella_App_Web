// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/widgets/builds/mobile/build_notes_input.dart';
import 'package:shella_design/features/cart/widgets/mobile/bottom_bar_CartDetails.dart';
import 'package:shella_design/features/cart/widgets/mobile/builds/build_notes_input.dart';

import 'package:shella_design/features/cart/widgets/mobile/header_details.dart';
import 'package:shella_design/common/util/app_styles.dart';


class CartDetailsScreen extends StatefulWidget {
  const CartDetailsScreen({
    super.key,
  });

  @override
  _CartDetailsScreenState createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final item = context.read<CartController>().selectedItem;
    if (item != null) {
      notesController.text =
          context.read<CartController>().getTempNote(item.id!);
    }
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    final item = cartController.selectedItem;

    if (item == null) {
      return const Center(child: Text('لم يتم اختيار عنصر'));
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.sp),
              child: buildHeader_Cart_details(context, item),
            ),

            //
            SizedBox(height: 8.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(context,
                      text: item.item?.name ?? "",
                      style: font14Black600W(context, lineHeight: 3)),

                  // CustomRichText(item: item),

                  SizedBox(height: 8.h),
                  Custom_Text(context,
                      text: item.item?.description ?? "",
                      style: font14Black600W(context, lineHeight: 3)),
                  SizedBox(height: 5.h),
                  Custom_Text(context,
                      text: "${item.price} ريال",
                      style: font14SecondaryColor500W(context)),

                  SizedBox(height: 16.h),

                  Custom_Text(context,
                      text: "ملاحظات إضافية", style: font14Black600W(context)),

                  SizedBox(height: 10.h),
                  buildNotesInput(context, notesController, onChanged: (val) {
                    cartController.setTempNote(item.id!, val);
                  }),
                  SizedBox(height: 20.h),
                  // buildButton(context),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
      BottomBar_CartDetails(item: item, cartController: cartController),
    );
  }
}