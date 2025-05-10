import 'package:flutter/material.dart';
import 'package:shella_design/features/Auth/widgets/mobile/start_shopping_btn.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_styles.dart';

class Succsessflycreated extends StatelessWidget {
  const Succsessflycreated({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 3.3,
            ),
            Image.asset(
              AppImages.logo,
              height: size.height / 4,
            ),
            SizedBox(height: size_16(context)),
            Text(
              "تم إنشاء الحساب بنجاح",
              style: font18Green500W(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size_16(context)),
            Text(
              "يمكنك تصفح التطبيق الــآن مع اخر العروض والخصومات",
              style: font14Grey400W(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size_18(context)),
            Spacer(),
            StartShoppingButton(),
            SizedBox(height: size_18(context)),
          ],
        ),
      ),
    );
  }
}
