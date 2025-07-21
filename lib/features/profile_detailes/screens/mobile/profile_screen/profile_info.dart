import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/loading/custom_loading.dart';
import 'package:shella_design/features/profile_detailes/controllers/custome_info_controller.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/build_mobile_profile/build_action_appBar.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/build_mobile_profile/build_delete_account_button.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/build_mobile_profile/build_error_widget.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/build_mobile_profile/build_no_data.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/build_mobile_profile/build_profile_info_body.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/build_mobile_profile/build_title_text.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: buildTitleText(),
        centerTitle: true,
        actions: [buildActionAppBar(context)],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<CustomerController>(builder: (context, provider, _) {
          return buildDeleteAccountButton(context, provider);
        }),
      ),
      body: Consumer<CustomerController>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return CustomLoading(color: AppColors.greenColor);
          }
          if (provider.toExternalReference != null) {
            return buildErrorWidget(provider);
          }
          final customer = provider.customer;
          if (customer == null) {
            return buildNoData();
          }
          return buildProfileInfoBody(context, customer);
        },
      ),
    );
  }
}
