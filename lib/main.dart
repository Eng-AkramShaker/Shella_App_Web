import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/Api_constants.dart';
<<<<<<< HEAD
=======

>>>>>>> c8e1746084cd043a3b9eece5f7e39cc05ceef464
import 'package:shella_design/common/util/appProviders.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/helper/check_Logged.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/sharedPre_constants.dart';
import 'package:shella_design/common/helper/date_converter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

<<<<<<< HEAD
  await init();
  await checkIfLoggedInUser();

  final sharedPreferences = await SharedPreferences.getInstance();
  const String baseUrl = Api_Constants.appBaseUrl;

  runApp(
    MultiProvider(
      providers: appProviders(appBaseUrl: baseUrl, sharedPreferences: sharedPreferences),
=======
  final sharedPreferences = await SharedPreferences.getInstance();
  const String baseUrl = Api_Constants.appBaseUrl;

  await init();
  await checkIfLoggedInUser();

  runApp(
    MultiProvider(
      providers: appProviders(
          appBaseUrl: baseUrl, sharedPreferences: sharedPreferences),
>>>>>>> c8e1746084cd043a3b9eece5f7e39cc05ceef464
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

<<<<<<< HEAD
=======
    // ✅ تهيئة المحول الزمني
>>>>>>> c8e1746084cd043a3b9eece5f7e39cc05ceef464
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


