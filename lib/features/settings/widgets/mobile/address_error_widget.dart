import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/profile_detailes_controller.dart';
import 'profile_buttons.dart';

class AddressErrorWidget extends StatelessWidget {
  final AddressController controller;

  const AddressErrorWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 40.w),
          const SizedBox(height: 20),
          Text(
            controller.errorMessage ?? 'فشل حذف العنوان',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ProfileButton(
              title: 'أعد المحاولة',
              onTap: () {
                controller.resetState();
                controller.getAddress();
              }),
        ],
      ),
    );
  }
}
