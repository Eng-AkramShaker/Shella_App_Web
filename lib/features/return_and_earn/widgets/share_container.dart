import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shella_design/common/util/app_colors.dart';

class ShareContainer extends StatelessWidget {
  const ShareContainer({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Share.share(_controller.text, subject: 'Sharing Text Field Content');
      },
      child: Container(
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            color: AppColors.wtColor),
        child: Image.asset(
          'assets/images/share.png',
          width: 15.w,
        ),
      ),
    );
  }
}
