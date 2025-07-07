import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/features/profile_detailes/screens/language_selection_page.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_ListTile.dart';
import 'package:shella_design/features/profile_detailes/widgets/profile_header.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import '../../../common/helper/app_routes.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Text(
          'تفاصيل الحساب',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          buildProfileHeader(),
          buildListTile('معلومات الحساب', Icons.account_circle, context, () {
            pushNewScreen(context, AppRoutes.profileInfo);
          }),
          buildListTile('العناوين المحفوظة', Icons.location_on, context, () {
            pushNewScreen(
              context,
              AppRoutes.addressDetails,
            );
          }),
          buildListTile('المفضلة لديك', Icons.favorite_border, context, () {}),
          buildListTile('اللغة', Icons.language, context, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LanguageSelectionPage()),
            );
          }, trailing: Text('العربية')),
          buildListTile('إحصائياتي', Icons.insert_chart, context, () {
            pushNewScreen(context, AppRoutes.statisticsScreen);
          }),
          buildListTile('محفظتي', Icons.account_balance_wallet, context, () {
            pushNewScreen(context, AppRoutes.walletScreen);
          }),
          buildListTile('محفظة قيدها', Icons.wallet_giftcard, context, () {
            pushNewScreen(context, AppRoutes.walletKaidhaScreen);
          }),
          buildListTile('كود الخصم', Icons.discount, context, () {
           Navigator.pushNamed(context, AppRoutes.discountScreen);
          }),
          buildListTile('قسائمي', Icons.local_offer, context, () {
            isWideScreen==true?
            pushNewScreen(context, AppRoutes.accountdetails):
            pushNewScreen(context, AppRoutes.myCouponScreen);
          }),
          buildListTile('نقاطي', Icons.stars_sharp, context, () {
            isWideScreen ? pushNewScreen(context,AppRoutes.myPointsWeb):
            pushNewScreen(context, AppRoutes.myPointsMobile);
          }),
          buildListTile('الرجوع والكسب', Icons.group, context, () {
            pushNewScreen(context, AppRoutes.returnAndEarnScreen);
          }),
          buildListTile('انضم كرجل توصيل', Icons.delivery_dining, context, () {
            pushNewScreen(context, AppRoutes.joinAsDriverOne);
          }),
          buildListTile('سياسة الخصوصية', Icons.privacy_tip, context, () {}),
          buildListTile('الحصول على المساعدة', Icons.help_outline, context, () {}),
          buildListTile('الشروط والأحكام', Icons.rule, context, () {}),
          buildListTile('سياسة الاسترداد', Icons.replay, context, () {}),
          buildListTile('المساعدة والدعم', Icons.support_agent, context, () {
            pushNewScreen(context, AppRoutes.helpAndSupport);
          }),
          buildListTile('الدردشة المباشرة', Icons.chat, context, () {
            pushNewScreen(context, AppRoutes.supportConversation);
          }),
          buildListTile('تسجيل الخروج', Icons.power_settings_new, context, () {}, color: Colors.red),
        ],
      ),
    );
  }
}
