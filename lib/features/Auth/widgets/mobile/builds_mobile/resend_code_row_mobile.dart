import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ResendCodeRow extends StatelessWidget {
  const ResendCodeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'في حال عدم وصول الرمز.',
          style: font14Black400W(context),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'إعادة الإرسال',
            style: font14Green500W(context),
          ),
        ),
      ],
    );
  }
}
