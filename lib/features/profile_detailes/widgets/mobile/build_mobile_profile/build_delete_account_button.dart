import 'package:flutter/material.dart';
import 'package:shella_design/features/profile_detailes/controllers/custome_info_controller.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/profile_buttons.dart';

Widget buildDeleteAccountButton(
    BuildContext context, CustomerController controller) {
  return ProfileButton(
    title: "حذف الحساب",
    textFontSize: 16,
    onTap: () {
      controller.deleteDialog(context, () async {
        await controller.deleteAccount(context);
      });
    },
  );
}
