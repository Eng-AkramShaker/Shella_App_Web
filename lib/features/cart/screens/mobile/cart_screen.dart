// ignore_for_file: file_names, avoid_unnecessary_containers, camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/lists.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';

import 'package:shella_design/common/widgets/divider/divider_2.dart';
import 'package:shella_design/features/cart/widgets/mobile/bottom_bar_CartScreen.dart';
import 'package:shella_design/features/cart/widgets/builds/mobile/build_cart_item.dart';
import 'package:shella_design/features/cart/widgets/builds/mobile/build_promo_code_input.dart';
import 'package:shella_design/features/cart/widgets/builds/mobile/build_summary_row.dart';

import 'package:shella_design/features/cart/controllers/cart_controller.dart';

import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/cart/widgets/mobile/bottom_bar_CartScreen.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({super.key});

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cartController = Provider.of<CartController>(
        context,
        listen: false,
      );
      cartController.loadCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: customAppBar(context, title: 'السلة'),
// <<<<<<< HEAD:lib/features/cart/screens/mobile/cart_screen.dart
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < items.length; index++)
                buildCartItem(items[index], index, context),

              buildPromoCodeInput(context),

              //
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildSummaryRow("المجموع الفرعي", "90 ريال", context),
                    Cus_Divider(color: AppColors.gryColor_2),
                    buildSummaryRow("الضرائب والرسوم", "0 ريال", context),
                    Cus_Divider(color: AppColors.gryColor_2),
                    buildSummaryRow("التوصيل", "15 ريال", context),
                    Cus_Divider(color: AppColors.gryColor_2),
                    buildSummaryRow("الإجمالي", "105 ريال", context,
                        extra: "(5 عناصر)", isBold: true),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
// =======
      // body: Consumer<CartController>(builder: (context, cartController, _) {
      //   return buildCartScreenBody(context, cartController);
      // }),
      bottomNavigationBar: BottomBar_CartScren(),
    );
  }
}
