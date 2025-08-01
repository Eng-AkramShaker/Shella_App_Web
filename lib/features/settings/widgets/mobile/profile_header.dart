import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/settings/controllers/custome_info_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';

import 'package:shella_design/features/settings/widgets/mobile/profile_buttons.dart';

import '../../../../common/widgets/loading_progress/loading/custom_loading.dart';

Widget buildProfileHeader(onTap) {
  return Consumer<ProfileController>(
    builder: (context, provider, _) {
      final customer = provider.user;

      if (provider.isLoading) {
        return const Center(child: CustomLoading(color: AppColors.greenColor));
      }
      if (provider.toExternalReference != null) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.toExternalReference!),
                const SizedBox(height: 10),
                ProfileButton(
                  title: 'إعادة المحاولة',
                  onTap: () => provider.fetchUserData(),
                ),
              ],
            ),
          ),
        );
      }
      if (customer == null) {
        return const Center(child: Text('لا توجد بيانات'));
      }

      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: customer.imageFullUrl != null ? NetworkImage(customer.imageFullUrl ?? "") : null,
                    backgroundColor: Colors.grey[300],
                    child: customer.imageFullUrl == null ? Icon(Icons.person, size: 40, color: Colors.grey[600]) : null,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.fullName ?? 'الاسم غير متوفر',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'معلومات الحساب',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Divider(),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.wGreyColor,
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
