import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/settings/widgets/mobile/profile_info_title.dart';

class profile_info_list extends StatelessWidget {
  const profile_info_list({
    super.key,
    required this.items,
  });

  final List<Map<String, String>> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(
          children: [
            ProfileInfoTile(
              title: item['title']!,
              value: item['value']!,
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                height: 1,
                thickness: 2,
                color: AppColors.dividerListColor,
              ),
            ),
            SizedBox(height: 12.h),
          ],
        );
      },
    );
  }
}