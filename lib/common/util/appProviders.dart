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
<<<<<<< HEAD
import 'package:shella_design/features/home/controllers/store_controller.dart';
import 'package:shella_design/features/home/domain/repositories/home_repository.dart';
import 'package:shella_design/features/home/domain/services/banner_service.dart';
import 'package:shella_design/features/home/domain/services/section_service.dart';
import 'package:shella_design/features/home/domain/services/store_service.dart';
=======
import 'package:shella_design/features/home/domain/repositories/home_repository.dart';
import 'package:shella_design/features/home/domain/services/home_service.dart';
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/my_coupon/domain/repositories/myCouponRepository/my_coupon_repositories.dart';
<<<<<<< HEAD
import 'package:shella_design/features/my_coupon/domain/services/my_coupon_services.dart';
=======
import 'package:shella_design/features/my_coupon/domain/services/myCouponService/my_coupon_services.dart';
import 'package:shella_design/features/orders/controllers/orders_controller.dart';
import 'package:shella_design/features/orders/domain/repositories/orders_repository.dart';
import 'package:shella_design/features/orders/domain/services/orders_service.dart';
>>>>>>> 2b64772d8c1fc65082d85a9e8b139e7a53cbe86c
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/features/product/controllers/product_controller.dart';
import 'package:shella_design/features/product/domain/repositories/productRepository/product_repository.dart';
import 'package:shella_design/features/product/domain/services/productService/product_service.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';

<<<<<<< HEAD
import '../../features/my_coupon/controllers/my_coupon_controller.dart';
import '../../features/my_points/controllers/my_points_controller.dart';
import '../../features/my_points/domain/repositories/my_points_repository.dart';
import '../../features/my_points/domain/services/my_points_service.dart';
import '../../features/splash/domain/services/splash_service.dart';
=======
final homeRepository = HomeRepository(
  bannerService: BannerService(),
  sectionService: SectionService(),
  storeService: StoreService(),
);
>>>>>>> cbf245c5eb9111054d49dcebfa146b6a1ee73b83

List<SingleChildWidget> appProviders = [
<<<<<<< HEAD
  ChangeNotifierProvider<AuthController>(
    create: (context) {
      final sharedPreferences = sp<SharedPreferences>();
      final apiClient = ApiClient(
        appBaseUrl: Api_Constants.appBaseUrl,
        sharedPreferences: sharedPreferences,
      );
      final authRepo = AuthRepo(
        apiClient: apiClient,
        sharedPreferences: sharedPreferences,
      );
      final authService = AuthService(authRepositoryInterface: authRepo);
      return AuthController(authServiceInterface: authService);
    },
  ),
  // ChangeNotifierProvider(
  //   create: (_) => AuthController(
  //     authServiceInterface: Provider<AuthRepositoryInterface>(
  //       create: (context) => AuthRepo(
  //         apiClient: ApiClient(
  //           appBaseUrl: Api_Constants.appBaseUrl,
  //           sharedPreferences: sp<SharedPreferences>(),
  //         ),
  //         sharedPreferences: sp<SharedPreferences>(),
  //       ),
  //       child: Provider<AuthService>(
  //         create: (context) => AuthService(
  //             authRepositoryInterface: context.read<AuthRepositoryInterface>()),
  //         child: ChangeNotifierProvider<AuthController>(
  //           create: (context) => AuthController(
  //               authServiceInterface: context.read<AuthService>()),
  //         ),
  //       ),
  //     ),
  //   ),
  // ),
  ChangeNotifierProvider(
    create: (_) => BannerProvider(homeRepository)..loadBanners(),
  ),
  ChangeNotifierProvider(
    create: (_) => SectionProvider(homeRepository)..fetchCategories(),
  ),
  ChangeNotifierProvider(
    create: (_) => StoreProvider(homeRepository)..fetchStores(),
  ),
  ChangeNotifierProvider(
      create: (_) => SplashController(SplashService())..loadConfig()),
  ChangeNotifierProvider(create: (_) => HomeController()),
  ChangeNotifierProvider(
    create: (_) => DiscountController(
        service:
            DiscountService(discountRepositoryInterface: DiscountRepository())),
  ),
=======
  //

  ChangeNotifierProvider(create: (_) => SplashController()),

  ChangeNotifierProvider(create: (_) => AuthController()),

  ChangeNotifierProvider(create: (_) => HomeController(HomeService(HomeRepository()))..getZones()),
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2
  ChangeNotifierProvider(create: (_) => KaidhaFormController()),
  ChangeNotifierProvider(create: (_) => ServeMeController()),
  ChangeNotifierProvider(create: (_) => SearchFilterController()),
  ChangeNotifierProvider(create: (_) => StartTrackingOrderController()),
  ChangeNotifierProvider(create: (_) => OrderTrackingController()),
  ChangeNotifierProvider(create: (_) => OrderDetailsConroller()),
  ChangeNotifierProvider(create: (_) => ScheduleController()),
<<<<<<< HEAD
  ChangeNotifierProvider(
      create: (_) => MyCouponController(
          myCouponServiceInterface: MyCouponServices(
              myCouponRepositoryInterface: MyCouponRepository()))
        ..getMyCoupon()),
  ChangeNotifierProvider(
    create: (_) {
      final service =
          LoyaltyService(myPointsRepositoryInterface: MyPointsRepository());
      return LoyaltyProvider(service)
        ..loadProfile()
        ..loadCoupons();
    },
  ),
<<<<<<< HEAD
=======

  ChangeNotifierProvider(create: (_) => ProductController(ProductService(ProductRepository()))),

  ChangeNotifierProvider(create: (_) => MyCouponController(myCouponServiceInterface: MyCouponServices(myCouponRepositoryInterface: MyCouponRepository()))..getMyCoupon()),

>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2
=======
  ChangeNotifierProvider(
      create: (_) => OrdersController(
            ordersServiceInterface: OrdersService(
              ordersRepositoryInterface: OrdersRepository(
                sharedPreferences: sp<SharedPreferences>(),
                apiClient: ApiClient(
                  appBaseUrl: Api_Constants.appBaseUrl,
                  sharedPreferences: sp<SharedPreferences>(),
                ),
              ),
            ),
          )
            ..getHistoryOrders()
            ..getrunningOrders()),
>>>>>>> 2b64772d8c1fc65082d85a9e8b139e7a53cbe86c
];
