import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_details/widget/action_buttons.dart';
import 'package:shella_design/features/orders_tracking/order_details/widget/detail_row.dart';
import 'package:shella_design/features/orders_tracking/order_details/widget/divider_section.dart';
import 'package:shella_design/features/orders_tracking/order_details/widget/items_section.dart';
import 'package:shella_design/features/orders_tracking/order_details/widget/payment_method_chip.dart';
import 'package:shella_design/features/orders_tracking/order_details/widget/status_indicator.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final orderDetailsConroller = Provider.of<OrderDetailsConroller>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(backgroundColor: AppColors.backgroundColor),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: custom_Images_asset(
                    image: AppImages.correctsign,
                    h: 75,
                    w: 75,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 15),
                DetailRow(title: "معرف الطلب", value: orderDetailsConroller.orderID, isBold: true),
                SizedBox(height: 15),
                DetailRow(title: "تاريخ الطلب", value: orderDetailsConroller.orderDate),
                SizedBox(height: 15),
                DetailRow(title: "اقل وقت مقدر لوصول طلبك", value: orderDetailsConroller.minimumTime),
                SizedBox(height: 15),
                DetailRow(title: "اقصى وقت مقدر لوصول طلبك", value: orderDetailsConroller.maxmumTime),
                DividerSection(),
                DetailRow(title: "رمز التحقق من التسليم :", value: "${orderDetailsConroller.deliveryCode}", valueStyle: true),
                SizedBox(height: 15),
                DetailRow(title: "نوع الطلب", value: orderDetailsConroller.requestType),
                SizedBox(height: 15),
                PaymentMethodChip(
                  text: orderDetailsConroller.paymentMethod,
                ),
                SizedBox(height: 15),
                StatusIndicator(
                  text: orderDetailsConroller.orderStatus,
                ),
                DividerSection(),
                ItemsSection(
                  text: '${orderDetailsConroller.itemCont} عنصر',
                ),
                DividerSection(),
                ActionButtons(),
              ],
            ),
          )),
    );
  }
}
