import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/appProviders.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/helper/check_Logged.dart';
import 'common/util/sharedPre_constants.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/repositories/cartRepository/cart_repository.dart';
import 'package:shella_design/features/cart/domain/services/cartService/cart_service.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await checkIfLoggedInUser();
  final sharedPreferences = await SharedPreferences.getInstance();
  const String baseUrl = "https://shalalfood.net"; 

  runApp(
    MultiProvider(
       providers: getAppProviders(
         appBaseUrl: baseUrl,
         sharedPreferences: sharedPreferences,
       ),
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