import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/helper/date_converter.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/domain/models/orders_model.dart';
import 'package:shella_design/features/orders/widgets/builds/build_order_buttons.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

Widget buildOrderCard(OrderModel orderItem, BuildContext context) {
  bool isParcel = orderItem.orderType == 'parcel';
  String logo = isParcel
      ? (orderItem.parcelCategory?.imageFullUrl ?? '')
      : (orderItem.store?.logoFullUrl ?? '');
  String name = isParcel ? 'parcel' : (orderItem.store?.name ?? '');
  String id = "#${orderItem.id}";

  // String date = DateConverter.dateTimeStringToDateTime(orderItem.createdAt!);

  return Card(
    color: AppColors.wtColor,
    child: SizedBox(
      height: 66.h,
      width: width_media(context),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: custom_Images_asset(
              image: logo,
              h: height_media(context),
              fit: BoxFit.contain,
              w: 65.w,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Custom_Text(
                      context,
                      text: name,
                      style: font12Black400W(context),
                    ),
                    Custom_Text(
                      context,
                      text: id,
                      style: font12Black400W(context),
                    ),
                  ],
                ),
                Custom_Text(
                  context,
                  text: orderItem.createdAt!,
                  style: font12Grey400W(context),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: buildOrderButtons(context),
          ),
        ],
      ),
    ),
  );
}
