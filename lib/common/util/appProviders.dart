// ignore_for_file: file_names

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';
import 'package:shella_design/features/Balance/controllers/balance_controller.dart';
import 'package:shella_design/features/address/controllers/address_controller.dart';
import 'package:shella_design/features/address/domain/services/address_service.dart';
import 'package:shella_design/features/address/domain/repositories/address_repo.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/helper/check_Logged.dart';

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
  ChangeNotifierProvider(create: (_) => BalanceController()),

  // Address Controller and dependencies
  ChangeNotifierProvider(create: (_) {
    final apiClient = ApiClient(
      appBaseUrl: Api_Constants.appBaseUrl,
      sharedPreferences: sp<SharedPreferences>(),
    );
    final repository = AddressRepositoryImpl(apiClient: apiClient);
    final service = AddressServiceImpl(addressRepository: repository);
    return AddressController(addressService: service);
  }),
];
