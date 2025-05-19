import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Favorite/controllers/discount_controller.dart';
import 'package:shella_design/features/Favorite/domain/repositories/features_repository.dart';
import 'package:shella_design/features/Favorite/domain/services/features_service.dart';
import 'package:shella_design/features/home/controllers/home_controller.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<ApiClient>(
    create: (context) {
      final sharedPreferences =
          Provider.of<SharedPreferences>(context, listen: false);
      return ApiClient(
        appBaseUrl: 'https://shalafood.net',
        sharedPreferences: sharedPreferences,
      );
    },
  ),
  ProxyProvider<ApiClient, FavoriteRepository>(
    update: (context, apiClient, previous) => FavoriteRepository(
      apiClient: apiClient,
    ),
  ),
  ProxyProvider<FavoriteRepository, FavoriteService>(
    update: (context, repository, previous) => FavoriteService(
      favoriteRepository: repository,
    ),
  ),
  ChangeNotifierProxyProvider<FavoriteService, FavoriteController>(
    create: (context) => FavoriteController(
        favoriteService: Provider.of(context, listen: false)),
    update: (context, service, previous) => previous!..updateService(service),
  ),
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
];
