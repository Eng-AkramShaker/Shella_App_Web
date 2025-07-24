import 'package:flutter/material.dart';
import 'package:shella_design/features/settings/controllers/custome_info_controller.dart';
import 'package:shella_design/features/settings/widgets/mobile/profile_buttons.dart';


Widget buildErrorWidget(CustomerController controller) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(controller.toExternalReference!),
        const SizedBox(height: 10),
        ProfileButton(
          title: 'إعادة المحاولة',
          onTap: () => controller.fetchCustomerData(),
        ),
      ],
    ),
  );
}