// ignore_for_file: file_names, avoid_unnecessary_containers, camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/cart/widgets/mobile/bottom_bar_CartScreen.dart';
import 'package:shella_design/features/cart/widgets/mobile/builds/build_cart_screen_body.dart';

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
      body: Consumer<CartController>(builder: (context, cartController, _) {
        return buildCartScreenBody(context, cartController);
      }),
      bottomNavigationBar: BottomBar_CartScren(),
    );
  }
}
