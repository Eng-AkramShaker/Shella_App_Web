// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/settings/controllers/custome_info_controller.dart';
import 'package:shella_design/features/settings/widgets/profile_buttons.dart';
import 'package:shella_design/features/settings/widgets/profile_divider.dart';
import 'package:shella_design/features/settings/widgets/profile_loading.dart';
import '../../../common/helper/app_routes.dart';
import '../widgets/profile_info_listTitle.dart';

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
        // iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'معلومات الحساب',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(left: 15, bottom: 5),
            decoration: BoxDecoration(color: AppColors.wtColor, borderRadius: BorderRadius.circular(12)),
            child: IconButton(
              splashColor: AppColors.wtColor,
              padding: EdgeInsets.zero,
              highlightColor: AppColors.wtColor,
              icon: Icon(
                Icons.mode_edit_outline_rounded,
                color: AppColors.greenColor,
                size: 24,
              ),
              onPressed: () => nav.push(AppRoutes.updateProfileInfoPage),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<ProfileController>(builder: (context, provider, _) {
          return ProfileButton(
            title: "حذف الحساب",
            textFontSize: 16,
            onTap: () {
              provider.deleteDialog(context, () async {
                print("🚀 بدء عملية حذف الحساب");
                await provider.deleteAccount(context);
              });
            },
          );
        }),
      ),
      body: Consumer<ProfileController>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: ProfileLoading(color: AppColors.greenColor));
          }
          if (provider.toExternalReference != null) {
            return Center(
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
            );
          }
          final user = provider.user;
          if (user == null) {
            return const Center(child: Text("لا توجد بيانات"));
          }
          // final items = [
          //   {'title': 'الاسم بالكامل', 'value': user.fullName},
          //   {'title': 'رقم الهاتف', 'value': user.phone},
          //   {'title': 'تاريخ الميلاد', 'value': formatDate(user.createdAt)},
          //   {'title': 'البريد الإلكتروني', 'value': user.email},
          //   {'title': 'كلمة المرور', 'value': '***********'},
          // ];
          //
          // return profile_info_list(items: items);
          return ListView(
            padding: EdgeInsets.all(6.w),
            children: [
              buildProfileInfoItem(
                "الاسم الكامل",
                user.fullName ?? "",
                context,
                () {},
              ),
              ProfileDivider(),
              buildProfileInfoItem(
                "رقم الهاتف",
                user.phone ?? "",
                context,
                () {},
              ),
              ProfileDivider(),
              buildProfileInfoItem(
                "تاريخ الميلاد",
                "01/01/2000",
                context,
                () {},
              ),
              ProfileDivider(),
              buildProfileInfoItem(
                "البريد الالكتروني",
                user.email ?? "لا يوجد إيميل",
                context,
                () {},
              ),
              ProfileDivider(),
              buildProfileInfoItem(
                "كلمة المرور",
                "********",
                context,
                () => nav.push(AppRoutes.passwordResetSuccessScreen),
              ),
              ProfileDivider(),
            ],
          );
        },
      ),
    );
  }
}
