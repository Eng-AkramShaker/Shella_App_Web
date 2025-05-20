import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/appBar/appBar.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/discount/controllers/discount_controller.dart';

import '../../../common/util/app_styles.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DiscountController>();
    Future.microtask(() => controller.loadDiscountedProducts());

    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: custom_AppBar(context, 'كود الخصم', Icons.arrow_back_sharp, Icons.percent),
      body: Consumer<DiscountController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error != null) {
            return Center(child: Text(controller.error!));
          }

          if (controller.products.isEmpty) {
            return const Center(child: Text("لا توجد عروض متاحة حالياً"));
          }

          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return Card(
                margin: EdgeInsets.all(8.w),
                child: ListTile(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}