import 'package:flutter/material.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/build_mobile_profile/build_appBar.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/build_mobile_profile/build_profile_details_body.dart';
import 'package:shella_design/common/util/app_colors.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({
    super.key,
  });

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 600;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(80, height / 15),
        child: buildAppBar('تفاصيل الحساب'),
      ),
      body: buildProfileDetailsBody(context, isWideScreen),
    );
  }
}
