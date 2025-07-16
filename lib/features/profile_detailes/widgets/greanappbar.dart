import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';

class GreanAppBar extends StatelessWidget {
  final String text;
  final IconData icon;
  const GreanAppBar({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Custom_Text(
            context,
            text: text,
            color: AppColors.wtColor,
            size: 18,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 25.r,
          ),
          SizedBox(
            width: 25.w,
          )
        ],
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
