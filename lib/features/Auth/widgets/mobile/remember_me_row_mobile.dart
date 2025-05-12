import 'package:flutter/material.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text(
              'تذكرني',
              style: font14Black500W(context),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            pushNewScreen(context, AppRoutes.forgetpassword);
          },
          child: Text(
            'نسيت كلمة المرور؟',
            style: font14Black500W(context),
          ),
        ),
      ],
    );
  }
}
