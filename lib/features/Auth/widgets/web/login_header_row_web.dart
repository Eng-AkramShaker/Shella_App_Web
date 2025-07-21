import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_icons.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/util/svg_icon_widget.dart';

class LoginHeaderRow extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  const LoginHeaderRow({
    super.key,
    required this.title,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onBack, icon: SvgIcon(iconTitle: AppIcons.backLogin)),
        const Spacer(),
        Text(
          title,
          style: font18Black700W(context, size: size_20(context)),
        ),
        const Spacer(),
      ],
    );
  }
}
