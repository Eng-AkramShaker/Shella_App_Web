import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/profile_detailes/controllers/custome_info_controller.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_buttons.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_divider.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_loading.dart';
import '../../../common/helper/app_routes.dart';
import '../../../common/util/app_navigators.dart';
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
            decoration: BoxDecoration(
                color: AppColors.wtColor,
                borderRadius: BorderRadius.circular(12)),
            child: IconButton(
              splashColor: AppColors.wtColor,
              padding: EdgeInsets.zero,
              highlightColor: AppColors.wtColor,
              icon: Icon(
                Icons.mode_edit_outline_rounded,
                color: AppColors.greenColor,
                size: 24,
              ),
              onPressed: () =>
                  pushNewScreen(context, AppRoutes.updateProfileInfoPage),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<CustomerController>(builder: (context, provider, _) {
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
      body: Consumer<CustomerController>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
                child: ProfileLoading(color: AppColors.greenColor));
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
                    onTap: () => provider.fetchCustomerData(),
                  ),
                ],
              ),
            );
          }
          final customer = provider.customer;
          if (customer == null) {
            return const Center(child: Text("لا توجد بيانات"));
          }
          // final items = [
          //   {'title': 'الاسم بالكامل', 'value': customer.fullName},
          //   {'title': 'رقم الهاتف', 'value': customer.phone},
          //   {'title': 'تاريخ الميلاد', 'value': formatDate(customer.createdAt)},
          //   {'title': 'البريد الإلكتروني', 'value': customer.email},
          //   {'title': 'كلمة المرور', 'value': '***********'},
          // ];
          //
          // return profile_info_list(items: items);
          return ListView(
            padding: EdgeInsets.all(6.w),
            children: [
              buildProfileInfoItem(
                "الاسم الكامل",
                customer.fullName ?? "",
                context,
                () {},
              ),
              ProfileDivider(),
              buildProfileInfoItem(
                "رقم الهاتف",
                customer.phone ?? "",
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
                customer.email ?? "لا يوجد إيميل",
                context,
                () {},
              ),
              ProfileDivider(),
              buildProfileInfoItem(
                "كلمة المرور",
                "********",
                context,
                () => pushNewScreen(
                    context, AppRoutes.passwordResetSuccessScreen),
              ),
              ProfileDivider(),
            ],
          );
        },
      ),
    );
  }
}
