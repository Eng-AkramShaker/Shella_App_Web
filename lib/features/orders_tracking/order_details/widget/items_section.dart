import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ItemsSection extends StatelessWidget {
  final String text;
  const ItemsSection({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final orderDetailsConroller = Provider.of<OrderDetailsConroller>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(
          context,
          text: text,
          style: font11Black500W(context, size: size_16(context)),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: orderDetailsConroller.itemImage.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    color: AppColors.backgroundColor,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: AppColors.gryColor_3)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: custom_Images_asset(
                        image: orderDetailsConroller.itemImage[index],
                      ),
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
