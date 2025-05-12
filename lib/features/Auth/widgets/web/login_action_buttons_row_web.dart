import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';

class LoginActionButtonsRow extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSend;
  const LoginActionButtonsRow({
    super.key,
    required this.onClose,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
            onPressed: onClose,
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.backgroundColor,
              side: BorderSide(color: Colors.grey[400]!),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            child: const Text(
              'إغلاق',
              style: TextStyle(fontSize: 14, color: Colors.black),
            )),
        ElevatedButton(
            onPressed: onSend,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundColor,
                side: const BorderSide(color: AppColors.secondaryColor),
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                )),
            child: const Text('تسجيل دخول', style: TextStyle(fontSize: 14, color: Colors.black)))
      ],
    );
  }
}
