import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/Api_constants.dart';

import 'package:shella_design/common/util/appProviders.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/helper/check_Logged.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';
import 'package:shella_design/common/helper/date_converter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  const String baseUrl = Api_Constants.appBaseUrl;

  await init();
  await checkIfLoggedInUser();

  runApp(
    MultiProvider(
      providers: appProviders(
          appBaseUrl: baseUrl, sharedPreferences: sharedPreferences),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log(isLoggedInUser.toString());

    // ✅ تهيئة المحول الزمني
    DateConverter.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'شلة',
      theme: ThemeData(fontFamily: 'Tajawal', useMaterial3: true),
      routes: AppRoutes.routes,
      initialRoute:
          isLoggedInUser ? AppRoutes.mainLayout : AppRoutes.Login_Mobile,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      navigatorKey: navigatorKey,
    );
  }
}


  //   599966674
  //   12345678


