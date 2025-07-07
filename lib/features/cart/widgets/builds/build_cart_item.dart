import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/cart/widgets/builds/build_item_details.dart';
import 'package:shella_design/features/cart/widgets/cart_item.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_navigators.dart';

Widget buildCartItem(CartItem item, int index, BuildContext context) {
  return InkWell(
    onTap: () {
      //

      pushNewScreen(context, AppRoutes.cartDetails);
    },
    child: Card(
      color: AppColors.wtColor,
      elevation: 3,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.h),
        width: width_media(context),
        child: BuildItemDetails(cartItem: item, index: index),
      ),
    ),
  );
}
