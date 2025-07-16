import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_dimensions.dart';
import '../../../../util/app_styles.dart';
import '../../../texts/custom_text.dart';

class NavItem {
  final String title;
  final IconData icon;

  NavItem({required this.title, required this.icon});
}

class NavItemWidget extends StatelessWidget {
  final NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              size: 18,
              color: isSelected ? AppColors.greenColor : AppColors.gryColor_5,
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Custom_Text(
                context,
                text: item.title,
                style: isSelected ? font12Green300W(context, size: size_4(context)) : font12Grey400W(context, size: size_4(context)),
              ),
            ),
            const SizedBox(height: 5),
            if (isSelected)
              const CircleAvatar(
                radius: 4,
                backgroundColor: AppColors.greenColor,
              ),
          ],
        ),
      ),
    );
  }
}
