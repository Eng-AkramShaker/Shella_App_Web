// ignore_for_file: file_names

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/helper/check_Logged.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/domain/repositories/auth_repo.dart';
import 'package:shella_design/features/Auth/domain/services/Auth_service.dart';
import 'package:shella_design/features/discount/controllers/discount_controller.dart';
import 'package:shella_design/features/discount/domain/repositories/discountRepository/discount_repository.dart';
import 'package:shella_design/features/discount/domain/services/discountService/discount_service.dart';
import 'package:shella_design/features/home/controllers/banner_controller.dart';
import 'package:shella_design/features/home/controllers/section_controller.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/home/controllers/store_controller.dart';
import 'package:shella_design/features/home/domain/services/banner_service.dart';
import 'package:shella_design/features/home/domain/services/section_service.dart';
import 'package:shella_design/features/home/domain/services/store_service.dart';
import 'package:shella_design/features/join_as_driver/controllers/join_as_driver_controller.dart';
import 'package:shella_design/features/join_as_driver/domain/repositories/joinAsDriverRepositiory/join_as_driver_repositories.dart';
import 'package:shella_design/features/join_as_driver/domain/services/joinAsDriverServices/join_as_driver_services.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/my_coupon/controllers/my_coupon_controller.dart';
import 'package:shella_design/features/my_coupon/domain/repositories/myCouponRepository/my_coupon_repositories.dart';
import 'package:shella_design/features/my_coupon/domain/services/myCouponService/my_coupon_services.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';
import 'package:shella_design/features/my_points/domain/repositories/my_points_repository.dart';
import 'package:shella_design/features/my_points/domain/services/my_points_service.dart';
import 'package:shella_design/features/orders/controllers/orders_controller.dart';
import 'package:shella_design/features/orders/domain/repositories/orders_repository.dart';
import 'package:shella_design/features/orders/domain/services/orders_service.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/features/profile_detailes/controllers/custome_info_controller.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/customer_info_repository.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/customer_info_reposittory_interface.dart';
import 'package:shella_design/features/profile_detailes/domain/services/customer_info_services.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';
import 'package:shella_design/features/splash/domain/services/splash_service.dart';

/// 🔹 Providers الأساسية التي تعتمد على SharedPreferences و ApiClient
List<SingleChildWidget> getAppProviders({
  required String appBaseUrl,
  required SharedPreferences sharedPreferences,
}) {
  return [
    Provider<ApiClient>(
      create: (_) => ApiClient(appBaseUrl: appBaseUrl, sharedPreferences: sharedPreferences),
    ),
    ChangeNotifierProvider(
      create: (context) => DriverRegisterController(
        deliveryManService: DeliveryManService(DeliveryManRepository()),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => SplashController(
        Provider.of<SplashService>(context, listen: false),
      ),
    ),
    ChangeNotifierProvider(create: (_) => HomeController()),
    ChangeNotifierProvider(
      create: (_) => DiscountController(
        service: DiscountService(discountRepositoryInterface: DiscountRepository()),
      ),
    ),
    Provider<CustomerRepositoryInterface>(
      create: (context) => CustomerRepository(apiClient: context.read<ApiClient>()),
    ),
    Provider<CustomerService>(
      create: (context) => CustomerService(
        customerRepository: context.read<CustomerRepositoryInterface>(),
      ),
    ),
    ChangeNotifierProvider<CustomerController>(
      create: (context) => CustomerController(service: context.read<CustomerService>())..fetchCustomerData(),
    ),
    ChangeNotifierProvider(create: (_) => KaidhaFormController()),
    ChangeNotifierProvider(create: (_) => ServeMeController()),
    ChangeNotifierProvider(create: (_) => SearchFilterController()),
    ChangeNotifierProvider(create: (_) => StartTrackingOrderController()),
    ChangeNotifierProvider(create: (_) => OrderTrackingController()),
    ChangeNotifierProvider(create: (_) => OrderDetailsConroller()),
    ChangeNotifierProvider(create: (_) => ScheduleController()),
  ];
}

/// 🔹 Providers الأخرى بدون الحاجة إلى تمرير SharedPreferences
List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<AuthController>(
    create: (context) {
      final sharedPreferences = sp<SharedPreferences>();
      final apiClient = ApiClient(appBaseUrl: Api_Constants.appBaseUrl, sharedPreferences: sharedPreferences);
      final authRepo = AuthRepo(apiClient: apiClient, sharedPreferences: sharedPreferences);
      final authService = AuthService(authRepositoryInterface: authRepo);
      return AuthController(authServiceInterface: authService);
    },
  ),
  ChangeNotifierProvider(create: (_) => BannerProvider(BannerService())..loadBanners()),
  ChangeNotifierProvider(create: (_) => SectionProvider(SectionService())..fetchCategories()),
  ChangeNotifierProvider(create: (_) => StoreProvider(StoreService())..fetchStores()),
  ChangeNotifierProvider(create: (_) => SplashController(SplashService())..loadConfig()),
  ChangeNotifierProvider(create: (_) => HomeController()),
  ChangeNotifierProvider(
    create: (_) => DiscountController(
      service: DiscountService(discountRepositoryInterface: DiscountRepository()),
    ),
  ),
  ChangeNotifierProvider(create: (_) => KaidhaFormController()),
  ChangeNotifierProvider(create: (_) => ServeMeController()),
  ChangeNotifierProvider(create: (_) => SearchFilterController()),
  ChangeNotifierProvider(create: (_) => StartTrackingOrderController()),
  ChangeNotifierProvider(create: (_) => OrderTrackingController()),
  ChangeNotifierProvider(create: (_) => OrderDetailsConroller()),
  ChangeNotifierProvider(create: (_) => ScheduleController()),
  ChangeNotifierProvider(
    create: (_) => MyCouponController(
      myCouponServiceInterface: MyCouponServices(myCouponRepositoryInterface: MyCouponRepository()),
    )..getMyCoupon(),
  ),
  ChangeNotifierProvider(
    create: (_) {
      final service = LoyaltyService(myPointsRepositoryInterface: MyPointsRepository());
      return LoyaltyProvider(service)
        ..loadProfile()
        ..loadCoupons();
    },
  ),
  ChangeNotifierProvider(
    create: (_) {
      final sharedPreferences = sp<SharedPreferences>();
      final apiClient = ApiClient(appBaseUrl: Api_Constants.appBaseUrl, sharedPreferences: sharedPreferences);
      final repository = OrdersRepository(sharedPreferences: sharedPreferences, apiClient: apiClient);
      final service = OrdersService(ordersRepositoryInterface: repository);

      return OrdersController(ordersServiceInterface: service)
        ..getHistoryOrders()
        ..getrunningOrders()
        ..getScheduleOrders();
    },
  ),
];
