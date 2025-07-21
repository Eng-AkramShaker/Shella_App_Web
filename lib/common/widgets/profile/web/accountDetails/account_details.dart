import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/profileDetailsRepository/profile_details_repository.dart';
import 'package:shella_design/features/profile_detailes/domain/services/profileDetailsService/profile_details_service.dart';
import '../../../../../features/profile_detailes/controllers/profile_detailes_controller.dart';
import '../../../../util/app_colors.dart';
import '../../../appBar/web/app_bar_web.dart';
import '../../../webFooter/web_footer.dart';
import '../accountContentArea/account_content_area.dart';
import '../accountHeader/account_header.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(
          profileDetailsService:
              ProfileDetailsService(profileRepository: ProfileRepository())),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: WebHomeApppar(),
        ),
        body: Consumer<ProfileController>(
          builder: (context, controller, child) => ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AccountHeader(controller: controller),
                    const SizedBox(height: 20),
                    AccountContentArea(controller: controller),
                    const SizedBox(height: 60),
                    const WebFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
