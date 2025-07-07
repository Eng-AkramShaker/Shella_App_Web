import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/profile_detailes/controllers/custome_info_controller.dart';

Widget buildProfileHeader() {
   return Consumer<CustomerController>(
    builder: (context, provider, _) {
      final customer = provider.customer;

      if (provider.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (customer == null) {
        return const Center(child: Text('لا توجد بيانات'));
      }

      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: customer.imageFullUrl != null
                  ? NetworkImage(customer.imageFullUrl!)
                  : null,
              backgroundColor: Colors.grey[300],
              child: customer.imageFullUrl == null
                  ? Icon(Icons.person, size: 40, color: Colors.grey[600])
                  : null,
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
                Text(
                  'معلومات الحساب',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
