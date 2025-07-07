import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_images.dart';
import '../../../../util/app_styles.dart';
import '../../../texts/custom_text.dart';

class FooterBottomSection extends StatelessWidget {
  final bool isMobile;
  const FooterBottomSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 0),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.cIcon),
          SizedBox(width: 5),
          Custom_Text(context, text: 'ShellaKsa 2024', style: font10Black400W(context, size: 12)),
          Spacer(),
          Row(
            children: [
              _buildIcon(FontAwesomeIcons.xTwitter, AppColors.bgColor),
              _buildIcon(FontAwesomeIcons.linkedin, AppColors.bluColor),
              _buildIcon(FontAwesomeIcons.instagram, AppColors.redColor),
              _buildIcon(FontAwesomeIcons.facebook, AppColors.bluColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, Color color) {
    return SizedBox(
      height: 10.h,
      width: 7.w,
      child: Icon(icon, color: color, size: 18),
    );
  }
}