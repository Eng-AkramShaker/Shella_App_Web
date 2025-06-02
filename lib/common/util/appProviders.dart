// ignore_for_file: file_names

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/my_coupon/domain/repositories/myCouponRepository/my_coupon_repositories.dart';
import 'package:shella_design/features/my_coupon/domain/services/my_coupon_services.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';

import '../../features/my_coupon/controllers/my_coupon_controller.dart';

List<SingleChildWidget> appProviders = [
  //

  ChangeNotifierProvider(create: (_) => SplashController()),

  ChangeNotifierProvider(create: (_) => AuthController()),

  ChangeNotifierProvider(create: (_) => HomeController()),
  ChangeNotifierProvider(create: (_) => KaidhaFormController()),
  ChangeNotifierProvider(create: (_) => ServeMeController()),

  ChangeNotifierProvider(create: (_) => SearchFilterController()),
  ChangeNotifierProvider(create: (_) => StartTrackingOrderController()),
  ChangeNotifierProvider(create: (_) => OrderTrackingController()),

  ChangeNotifierProvider(create: (_) => OrderDetailsConroller()),
  ChangeNotifierProvider(create: (_) => ScheduleController()),

  ChangeNotifierProvider(create: (_) => MyCouponController(myCouponServiceInterface: MyCouponServices(myCouponRepositoryInterface: MyCouponRepository()))..getMyCoupon()),

];
