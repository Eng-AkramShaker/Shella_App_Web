import 'package:flutter/material.dart';

import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_buttons.dart';

import 'package:shella_design/common/util/app_colors.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? customContent;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Color confirmColor;
  final Color cancelColor;

  const CustomDialog({
    super.key,
    required this.title,
    this.content,
    this.customContent,
    this.confirmText = 'تأكيد',
    this.cancelText = 'إلغاء',
    required this.onConfirm,
    required this.onCancel,
    this.confirmColor = AppColors.greenColor,
    this.cancelColor = AppColors.gryColor_2,
  }) : assert(content != null || customContent != null,
            'يجب توفير إما محتوى نصي أو محتوى مخصص');

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),
            // Content
            _buildContent(),
            const SizedBox(height: 24),
            // Buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (content != null) {
      return Text(
        content!,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
          height: 1.5,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: customContent!,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: ProfileButton(
            onTap: onCancel,
            title: cancelText,
            backGroundColor: cancelColor,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ProfileButton(
            onTap: onConfirm,
            title: confirmText,
            backGroundColor: confirmColor,
          ),
        ),
      ],
    );
  }

  static Future<T?> showCustomDialog<T>({
    required BuildContext context,
    required String title,
    required VoidCallback onConfirm,
    String? content,
    Widget? customContent,
    bool barrierDismissible = false,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => CustomDialog(
        title: title,
        content: content,
        customContent: customContent,
        onConfirm: onConfirm,
        onCancel: () => Navigator.pop(context, false),
      ),
    );
  }
}
