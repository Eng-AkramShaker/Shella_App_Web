import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/date_converter.dart';
import 'package:shella_design/common/util/appProviders.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/helper/check_Logged.dart';
import 'common/util/navigation/navigation.dart';
import 'common/util/sharedPre_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await checkIfLoggedInUser();
  runApp(
    MultiProvider(
      providers: appProviders,
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
    DateConverter.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'شلة',
      routes: AppRoutes.routes,
      initialRoute: isLoggedInUser ? AppRoutes.mainLayout : AppRoutes.Login_Mobile,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      // navigatorObservers: [FlutterSmartDialog.observer],
      navigatorKey: navigatorKey,
    );
  }
}



  //   599966674
  //   Na25526aa


  //  Card(
  //     color: Colors.red,
  //     child: ElevatedButton(
  //       child: const Text('data'),
  //       onPressed: () async {
  //         Get.find<CategoryController>().getCategoryList(true);
  //     },
  //    ),
  //  ),

  