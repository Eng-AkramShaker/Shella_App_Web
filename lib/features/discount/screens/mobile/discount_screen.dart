import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';
import 'package:shella_design/features/discount/controllers/discount_controller.dart';
import 'package:shella_design/features/discount/widgets/mobile/discount_content.dart';
import 'package:shella_design/features/discount/widgets/mobile/discount_grid_view.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DiscountController>();
    Future.microtask(() => controller.loadDiscountedProducts());

    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: custom_AppBar(
        context,
        title: MainAppConstants.discountCode,
        icon: Icons.arrow_back_sharp,
        titleIcon: Icons.percent,
      ),
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
          return discountGridView(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return DiscountGridContent(product: product);
              });
        },
      ),
    );
  }
}
