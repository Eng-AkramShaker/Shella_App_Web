import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/discount/domain/models/discount_model.dart';
class DiscountListTile extends StatelessWidget {
  const DiscountListTile({
    super.key,
    required this.product,
  });

  final DiscountProduct product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.image,
        width: 60.w,
        height: 60.h,
        errorBuilder: (_, __, ___) => const Icon(Icons.image),
      ),
      title: Text(product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Custom_Text (context,  text:'المتجر: ${product.storeName}',
        style: font18Black400W(
        context,
      )),
          Custom_Text(context,  text :'السعر الأصلي: ${product.price.toStringAsFixed(2)}',
             style: font18Black400W(
        context,
      )),
        Custom_Text(context,  text:
            'السعر بعد الخصم: ${product.finalPrice.toStringAsFixed(2)}',   
             style: font18SecondaryColor500W(
        context,
      )),
         Custom_Text(context,  text: 'الكمية المتاحة: ${product.stock}',
         style: font18Black400W(
        context,
      )),
        ],
      ),
    );
  }
}