import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_icons.dart';
import 'package:shella_design/common/util/svg_icon_widget.dart';

class OtpHeader extends StatelessWidget {
  final VoidCallback onBack;
  const OtpHeader({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onBack, icon: SvgIcon(iconTitle: AppIcons.backLogin)),
        const Spacer(),
        Text(
          'إدخال رمز التأكيد',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
      ],
    );
  }
}
