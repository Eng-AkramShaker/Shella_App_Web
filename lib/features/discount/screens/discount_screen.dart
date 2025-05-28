import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/appBar/appBar.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/discount/controllers/discount_controller.dart';
import 'package:shella_design/features/discount/widgets/discount_content.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DiscountController>();
    Future.microtask(() => controller.loadDiscountedProducts());

    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: custom_AppBar(
          context, 'كود الخصم', Icons.arrow_back_sharp, Icons.percent),
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

          return GridView.builder(
            padding: EdgeInsets.all(16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.6, // تعديل النسبة لتحسين الشكل
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return DiscountGridContent(product: product);
            },
          );
        },
      ),
    );
  }
}


