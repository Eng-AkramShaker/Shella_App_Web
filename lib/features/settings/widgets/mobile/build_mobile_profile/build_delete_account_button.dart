import 'package:flutter/material.dart';

import '../../../controllers/custome_info_controller.dart';
import '../profile_buttons.dart';

Widget buildDeleteAccountButton(BuildContext context, ProfileController controller) {
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
