// ignore_for_file: file_names

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/domain/repositories/auth_repo.dart';
import 'package:shella_design/features/Auth/domain/services/Auth_service.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/repositories/cartRepository/cart_repository.dart';
import 'package:shella_design/features/cart/domain/services/cartService/cart_service.dart';
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
import 'package:shella_design/features/my_coupon/controllers/my_coupon_controller.dart';
import 'package:shella_design/features/my_coupon/domain/repositories/myCouponRepository/my_coupon_repositories.dart';
import 'package:shella_design/features/my_coupon/domain/services/myCouponService/my_coupon_services.dart';
import 'package:shella_design/features/my_points/controllers/my_points_controller.dart';
import 'package:shella_design/features/my_points/domain/repositories/my_points_repository.dart';
import 'package:shella_design/features/my_points/domain/services/my_points_service.dart';
import 'package:shella_design/features/notifications/controllers/notifications_controller.dart';
import 'package:shella_design/features/notifications/domain/repositories/notification_repository.dart';
import 'package:shella_design/features/notifications/domain/services/notification_service.dart';
import 'package:shella_design/features/orders/controllers/orders_controller.dart';
import 'package:shella_design/features/orders/domain/repositories/orders_repository.dart';
import 'package:shella_design/features/orders/domain/services/orders_service.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/features/search_filter/controller/product_provider.dart';
import 'package:shella_design/features/settings/controllers/custome_info_controller.dart';
import 'package:shella_design/features/settings/domain/repositories/customer_info_repository.dart';
import 'package:shella_design/features/settings/domain/repositories/customer_info_reposittory_interface.dart';
import 'package:shella_design/features/settings/domain/services/customer_info_services.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';
import 'package:shella_design/features/splash/domain/services/splash_service.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/reposotories/kaidhaSub_repository.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/services/kaidhaSub_service.dart';
import '../../features/settings/controllers/profile_detailes_controller.dart';
import '../../features/settings/domain/repositories/profileDetailsRepository/profile_details_repository.dart';
import '../../features/settings/domain/services/profileDetailsService/profile_details_service.dart';

List<SingleChildWidget> appProviders({required String appBaseUrl, required SharedPreferences sharedPreferences}) {
  // Repository   & Service  ================================================================================

  final apiClient = ApiClient(sharedPreferences: sharedPreferences);

  //  auth   =======
  final authRepo = AuthRepo(apiClient: apiClient, sharedPreferences: sharedPreferences);
  final authService = AuthService(authRepositoryInterface: authRepo);

  //  customer   =======
  final customerRepo = CustomerRepository(apiClient: apiClient);
  final customerService = CustomerService(customerRepository: customerRepo);

  //  cart   =======
  final cartRepo = CartRepository(apiClient: apiClient);
  final cartService = CartService(cartRepository: cartRepo);

  //  orders   =======
  final ordersRepo = OrdersRepository(sharedPreferences: sharedPreferences, apiClient: apiClient);
  final ordersService = OrdersService(ordersRepositoryInterface: ordersRepo);

  //  notification   =======
  final notificationRepo = NotificationRepository(sharedPreferences: sharedPreferences, apiClient: apiClient);
  final notificationService = NotificationService(notificationRepositoryInterface: notificationRepo);

  //  profile  =======
  final profileRepo = ProfileRepository();
  final profileService = ProfileDetailsService(profileRepository: profileRepo);

  //  wallet Kaidha Subscription   =======
  final walletKaidhaSubscriptionRepo = KaidhaSubRepository(apiClient: apiClient);
  final walletKaidhaSubscriptionService = kaidhaSubService(kaidhaSubRepositoryinterface: walletKaidhaSubscriptionRepo);

  return [
    //        Provider  ======================================================================================

    Provider<ApiClient>.value(value: apiClient),
    Provider<CustomerRepositoryInterface>.value(value: customerRepo),
    Provider<CustomerService>.value(value: customerService),

    ChangeNotifierProvider(create: (_) => SplashController(SplashService())..loadConfig()),
    ChangeNotifierProvider(create: (_) => AuthController(authServiceInterface: authService)),
    ChangeNotifierProvider(create: (_) => ProfileController(service: customerService)..fetchUserData()),

    /// ✅ تم إضافة ملفات البروفايل هنا
    Provider<ProfileRepository>.value(value: profileRepo),
    Provider<ProfileDetailsService>.value(value: profileService),
    ChangeNotifierProvider(create: (_) => AddressController(profileDetailsService: profileService)),

    // Home
    ChangeNotifierProvider(create: (_) => BannerProvider(BannerService())..loadBanners()),
    ChangeNotifierProvider(
        create: (_) => SectionProvider(SectionService())
          ..fetchCategories()
          ..fetchModules()),
    ChangeNotifierProvider(create: (_) => StoreProvider(StoreService())..fetchStores()),
    ChangeNotifierProvider(create: (_) => HomeController()),

    ChangeNotifierProvider(
      create: (context) => AddressController(
        profileDetailsService: ProfileDetailsService(profileRepository: ProfileRepository()),
      ),
    ),
    ChangeNotifierProvider(
      create: (_) => CartController(cartService: cartService),
    ),

    // Discount
    ChangeNotifierProvider(
        create: (_) => DiscountController(service: DiscountService(discountRepositoryInterface: DiscountRepository()))),

    // Join as Driver
    ChangeNotifierProvider(create: (_) => DriverRegisterController(deliveryManService: DeliveryManService(DeliveryManRepository()))),

    // Orders
    ChangeNotifierProvider(
      create: (_) => OrdersController(ordersServiceInterface: ordersService)
        ..getHistoryOrders()
        ..getrunningOrders()
        ..getScheduleOrders(),
    ),

    ChangeNotifierProvider(create: (_) => OrderDetailsConroller()),
    ChangeNotifierProvider(create: (_) => OrderTrackingController()),
    ChangeNotifierProvider(create: (_) => StartTrackingOrderController()),

    // Notifications
    ChangeNotifierProvider(create: (_) => NotificationsController(notificationServiceInterface: notificationService)),

    // My Coupon
    ChangeNotifierProvider(
      create: (_) => MyCouponController(
        myCouponServiceInterface: MyCouponServices(myCouponRepositoryInterface: MyCouponRepository()),
      )..getMyCoupon(),
    ),

    // My Points
    ChangeNotifierProvider(
      create: (_) => LoyaltyProvider(LoyaltyService(myPointsRepositoryInterface: MyPointsRepository()))
        ..loadProfile()
        ..loadCoupons(),
    ),

    // Others
    ChangeNotifierProvider(create: (_) => ServeMeController()),
    ChangeNotifierProvider(create: (_) => SearchFilterController(apiClient: ApiClient(sharedPreferences: sharedPreferences))),
    ChangeNotifierProvider(create: (_) => ScheduleController()),
    ChangeNotifierProvider(create: (context) => ProductProviderr()),

    //  wallet Kaidha Subscription   =======

    ChangeNotifierProvider(create: (_) => KaidhaSubscription_Controller(kaidhaSubServiceInterface: walletKaidhaSubscriptionService)),
    ChangeNotifierProvider(create: (_) => KaidhaSubscription_Controller(kaidhaSubServiceInterface: walletKaidhaSubscriptionService)),
  ];
}
