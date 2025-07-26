// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/svg_icon_widget.dart';
import 'package:shella_design/features/notifications/controllers/notifications_controller.dart';
import 'package:shella_design/features/settings/screens/language_selection_page.dart';
import 'package:shella_design/features/settings/widgets/profile_ListTile.dart';
import 'package:shella_design/features/settings/widgets/profile_divider.dart';
import 'package:shella_design/features/settings/widgets/profile_header.dart';
import 'package:shella_design/common/util/app_colors.dart';

import '../../../common/helper/app_routes.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Text('تفاصيل الحساب', style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          buildProfileHeader(() {
            nav.push(AppRoutes.profileInfo);
          }),
          ProfileDivider(),
          buildListTile('العناوين المحفوظة', Icon(Icons.location_on_outlined), context, () {
            nav.push(
              AppRoutes.addressDetails,
            );
          }),
          ProfileDivider(),
          buildListTile('المفضلة لديك', Icon(Icons.favorite_border), context, () {}),
          ProfileDivider(),
          buildListTile(
            'اللغة',
            Icon(Icons.language),
            context,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageSelectionPage()),
              );
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'العربية',
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.wGreyColor,
                )
              ],
            ),
          ),
          ProfileDivider(),
          buildListTile('إحصائياتي', SvgIcon(iconTitle: AppImages.statistics), context, () {
            nav.push(AppRoutes.statisticsScreen);
          }),
          ProfileDivider(),
          buildListTile(
            'محفظتي',
            SvgIcon(iconTitle: AppImages.wallet),
            context,
            () {
              nav.push(AppRoutes.walletScreen);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '0',
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.wGreyColor,
                )
              ],
            ),
          ),
          ProfileDivider(),
          buildListTile('الاشتراك في قيدها', Icon(Icons.account_circle_outlined), context, () {
            nav.push(AppRoutes.main_subscription);
          }),
          ProfileDivider(),
          buildListTile('محفظة قيدها', SvgIcon(iconTitle: AppImages.wallet), context, () {
            nav.push(AppRoutes.kaidhaWallet);
          }),
          ProfileDivider(),
          buildListTile('بطاقاتي', SvgIcon(iconTitle: AppImages.wallet), context, () {
            // nav.push(AppRoutes.walletKaidha_Step_1_Screen);
          }),
          ProfileDivider(),
          buildListTile('كود الخصم', SvgIcon(iconTitle: AppImages.discountSvg), context, () {
            Navigator.pushNamed(context, AppRoutes.discountScreen);
          }),
          ProfileDivider(),
          buildListTile('قسائمي', SvgIcon(iconTitle: AppImages.profileCoupon), context, () {
            isWideScreen == true ? nav.push(AppRoutes.accountdetails) : nav.push(AppRoutes.myCouponScreen);
          }),
          ProfileDivider(),
          buildListTile('الرجوع والكسب', SvgIcon(iconTitle: AppImages.people), context, () {
            nav.push(AppRoutes.returnAndEarnScreen);
          }),
          ProfileDivider(),
          buildListTile('نقاطي', SvgIcon(iconTitle: AppImages.myPoints), context, () {
            isWideScreen ? nav.push(AppRoutes.myPointsWeb) : nav.push(AppRoutes.myPointsMobile);
          }),
          ProfileDivider(),
          buildListTile('انضم كرجل توصيل', Icon(Icons.account_circle_outlined), context, () {
            nav.push(AppRoutes.joinAsDriverOne);
          }),
          ProfileDivider(),
          buildListTile(
            'سياسة الخصوصية',
            Icon(Icons.privacy_tip_outlined),
            context,
            () {},
          ),
          ProfileDivider(),
          buildListTile(
            'الحصول على المساعدة',
            Icon(Icons.help_outline),
            context,
            () {},
          ),
          ProfileDivider(),
          buildListTile(
            'الشروط والأحكام',
            Icon(Icons.list_alt_outlined),
            context,
            () {},
          ),
          ProfileDivider(),
          buildListTile(
            'سياسة الاسترداد',
            SvgIcon(iconTitle: AppImages.refundPolicy),
            context,
            () {},
          ),
          ProfileDivider(),
          buildListTile('المساعدة والدعم', SvgIcon(iconTitle: AppImages.support), context, () {
            nav.push(AppRoutes.helpAndSupport);
          }),
          ProfileDivider(),
          buildListTile('الدردشة المباشرة', Icon(Icons.comment_outlined), context, () {
            nav.push(AppRoutes.supportConversation);
          }),
          ProfileDivider(),
          Consumer<NotificationsController>(builder: (context, controller, _) {
            return buildListTile(
              'الاشعارات',
              Icon(Icons.notifications_none_outlined),
              context,
              () {},
              trailing: Switch(
                value: controller.notificationsEnabled,
                onChanged: (value) {
                  controller.toggleNotifications(value);
                },
                activeColor: AppColors.greenColor,
                inactiveThumbColor: Colors.grey[300],
                inactiveTrackColor: Colors.grey[400],
                activeTrackColor: AppColors.greenColor.withOpacity(0.3),
              ),
            );
          }),
          ProfileDivider(),
          buildListTile(
            'تسجيل الخروج',
            Icon(Icons.power_settings_new, color: AppColors.greenColor),
            context,
            () {},
            color: Colors.red,
            trailing: SizedBox(height: 1, width: 1),
          ),
        ],
      ),
    );
  }
}
