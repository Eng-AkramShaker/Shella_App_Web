import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orderTrackingController = Provider.of<OrderTrackingController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: Card(
            color: AppColors.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  custom_Images_asset(image: orderTrackingController.deliveryImage, h: 20, w: 20),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(context,
                          text: orderTrackingController.deliveryName, style: font11Black600W(context, size: size_10(context))),
                      Custom_Text(context,
                          text: orderTrackingController.deliveryCar, style: font11Black400W(context, size: size_8(context))),
                    ],
                  ),
                  Spacer(flex: 1),
                  IconButtonCircle(
                    onPressed: () {},
                    icon: Icons.call_outlined,
                    iconsize: 15,
                    height: 24,
                    width: 24,
                  ),
                  IconButtonCircle(
                    onPressed: () {},
                    iconsize: 15,
                    icon: Icons.message_outlined,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 30,
          child: InkWell(
            onTap: () {
              pushNewScreen(context, orderTrackingController.storeRouts);
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: custom_Images_asset(image: orderTrackingController.storeImage, h: 30, w: 30),
                ),
                Custom_Text(context,
                    text: "${orderTrackingController.storeName}   >", style: font10Black600W(context, size: size_10(context)))
              ],
            ),
          ),
        ),
        Divider(),
        SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Custom_Text(context,
                  text: "${orderTrackingController.orderPrice} ل.س", style: font11Black500W(context, size: size_11(context))),
              Spacer(flex: 1),
              custom_Images_asset(image: AppImages.icon_pay, h: 17, w: 24),
              SizedBox(width: 10),
              Custom_Text(context, text: orderTrackingController.payType, style: font11Black500W(context, size: size_11(context))),
            ],
          ),
        ),
        SizedBox(height: 20),
        Custom_Text(context,
            text: "${orderTrackingController.itemCont} عنصر", style: font11Black500W(context, size: size_11(context))),
        SizedBox(height: 10),
        SizedBox(
            height: 25,
            child: Row(
              children: [
                custom_Images_asset(image: orderTrackingController.orderImage, h: 25, w: 25),
                SizedBox(width: 5),
                Custom_Text(context,
                    text: "${orderTrackingController.itemCont} X", style: font11Black500W(context, size: size_11(context))),
              ],
            )),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: AppColors.gryColor_3, width: 1),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.list_alt_outlined, color: AppColors.bgColor, size: 20),
              SizedBox(width: 5),
              Custom_Text(
                context,
                text: "عرض تفاصيل الطلب",
                style: font10Black400W(context, size: size_13(context)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
