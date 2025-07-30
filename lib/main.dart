// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/appProviders.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/helper/check_Logged.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';
import 'package:shella_design/common/helper/date_converter.dart';
import 'common/util/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  const String baseUrl = ApiConstants.appBaseUrl;

  await init(); // تهيئة الكاش أو الخدمات
  await checkIfLoggedInUser(); // حالة تسجيل الدخول

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/language',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'), // يبدأ دائمًا بالعربية
      child: MultiProvider(
        providers: appProviders(appBaseUrl: baseUrl, sharedPreferences: sharedPreferences),
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateConverter.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'شلة',
      navigatorKey: navigatorKey,

      // ربط اللغة والاتجاه بالتطبيق

      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,

      routes: AppRoutes.routes,

      initialRoute: isLoggedInUser ? AppRoutes.mainLayout : AppRoutes.onBoarding,

      theme: ThemeData(
        fontFamily: 'Tajawal',
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppColors.greenColor,
        ).copyWith(surface: AppColors.wtColor).copyWith(error: AppColors.redColor),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.greenColor.withAlpha(100),
          cursorColor: AppColors.greenColor,
          selectionHandleColor: AppColors.greenColor,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
    );
  }
}


  //  599966674
  //  12345678

  //  Na25526aa

  //  Akram123@#

  //  akrrdam@gmail.com

  // Card(
  //       color: Colors.red,
  //       child: ElevatedButton(
  //         child: const Text('data'),
  //         onPressed: () async {
  //           //
  //           nav.push(AppRoutes.splashscreen);
  //         },
  //       ),
  //     ),


  //  599977725
  //  Aa12345678

  //  1126305067
 

 
    // showConfirmationDialog(
    //   context: context,
    //   title: "هل قمت بالمصادقة داخل تطبيق نفاذ ؟",
    //   description: "هذه مرحه تحقق هل تم تأكيد الكود بنجاح أم لا ",
    //   onConfirmed: () async {
    //     //
    //     await Nafath_send_checkStatus(context, nationalId);
    //   },
    // );
 

 