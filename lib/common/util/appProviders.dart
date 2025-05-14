// ignore_for_file: file_names

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';
import 'package:shella_design/features/home/controllers/category_controller.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/home/controllers/store_controller.dart';
import 'package:shella_design/features/home/domain/services/banner_service.dart';
import 'package:shella_design/features/home/domain/services/category_service.dart';
import 'package:shella_design/features/home/domain/services/store_service.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';

List<SingleChildWidget> appProviders = [
  //
  ChangeNotifierProvider(
    create: (_) => BannerProvider(BannerService())..loadBanners(),
  ),
  ChangeNotifierProvider(
    create: (_) => CategoryProvider(CategoryService())..fetchCategories(),
  ),
  ChangeNotifierProvider(
      create: (_) => StoreProvider(StoreService())..fetchStores()),

  ChangeNotifierProvider(create: (_) => SplashController()),

  ChangeNotifierProvider(create: (_) => HomeController()),
  ChangeNotifierProvider(create: (_) => KaidhaFormController()),
  ChangeNotifierProvider(create: (_) => ServeMeController()),

  ChangeNotifierProvider(create: (_) => SearchFilterController()),
  ChangeNotifierProvider(create: (_) => StartTrackingOrderController()),
  ChangeNotifierProvider(create: (_) => OrderTrackingController()),

  ChangeNotifierProvider(create: (_) => OrderDetailsConroller()),
  ChangeNotifierProvider(create: (_) => ScheduleController()),
];
