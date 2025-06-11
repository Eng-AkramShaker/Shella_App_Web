// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/widgets/bottom_Navigation.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart';
import 'package:shella_design/features/Auth/domain/repositories/auth_repository_interface.dart';
import 'package:shella_design/features/Auth/screens/mobile/ConfirmPassword_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/forgetpassword_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/login_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/mobilelVerification_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/passwordResetSuccessScreen%20_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/signup_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/succsessflyCreated_mobile.dart';
import 'package:shella_design/features/Auth/screens/web/login.dart';
import 'package:shella_design/features/Auth/screens/web/otp_screen.dart';
import 'package:shella_design/features/cart/controllers/cart_controller.dart';
import 'package:shella_design/features/cart/domain/repositories/cartRepository/cart_repository.dart';
import 'package:shella_design/features/cart/domain/services/cartService/cart_service.dart';
import 'package:shella_design/features/cart/screens/cart_details_screen.dart';
import 'package:shella_design/features/cart/screens/cart_screen.dart';
import 'package:shella_design/features/discount/controllers/discount_controller.dart';
import 'package:shella_design/features/discount/screens/discount_screen.dart';
import 'package:shella_design/features/help_and_support/screens/help_and_support_screen.dart';
import 'package:shella_design/features/home/hyper/screens/hyper_screen.dart';
import 'package:shella_design/features/home/shops/screens/shops_screen.dart';
import 'package:shella_design/features/home/super/screens/super_screen.dart';
import 'package:shella_design/features/home/users/screens/user_home_screen.dart';
import 'package:shella_design/features/join_as_driver/screens/join_as_driver_one.dart';
import 'package:shella_design/features/join_as_driver/screens/join_as_driver_two.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/kaidha_form/screen/aliashtirak_fi_qaydiha.dart';
import 'package:shella_design/features/kaidha_form/screen/verify_source_of_income.dart';
import 'package:shella_design/features/my_coupon/screens/my_coupon_screen.dart';
import 'package:shella_design/features/notifications/notifications.dart';
import 'package:shella_design/features/onboarding/screen/onboarding.dart';
import 'package:shella_design/features/onboarding/screen/onboarding_end.dart';
import 'package:shella_design/features/onboarding/screen/splash_screen.dart';
import 'package:shella_design/features/orders/screens/order_screen/orders_page.dart';
import 'package:shella_design/features/orders/screens/service_screen/address_details_service.dart';
import 'package:shella_design/features/orders/screens/service_screen/step_one_service_screen.dart';
import 'package:shella_design/features/orders/screens/service_screen/step_tow_service_screen.dart';
import 'package:shella_design/features/orders_tracking/order_details/controller/order_details_conroller.dart';
import 'package:shella_design/features/orders_tracking/order_details/screen/order_details.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/controller/order_tracking_controller.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/screen/order_tracking.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/controller/start_tracking_order_controller.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/screen/start_tracking_order.dart';
import 'package:shella_design/features/payment/screens/add_New_card.dart';
import 'package:shella_design/features/payment/screens/payment.dart';
import 'package:shella_design/features/payment/screens/payment_method.dart';
import 'package:shella_design/features/product/screens/product_details_screen.dart';
import 'package:shella_design/features/product/screens/product_screen.dart';
import 'package:shella_design/features/profile_detailes/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/profileDetailsRepository/profile_details_repository.dart';
import 'package:shella_design/features/profile_detailes/domain/services/profileDetailsService/profile_details_service.dart';
import 'package:shella_design/features/profile_detailes/screens/addNewAdress.dart';
import 'package:shella_design/features/profile_detailes/screens/adressDetailes.dart';
import 'package:shella_design/features/profile_detailes/screens/profile_info.dart';
import 'package:shella_design/features/return_and_earn/screens/return_and_earn_screen.dart';
import 'package:shella_design/features/schedule_order/controller/schedule_controller.dart';
import 'package:shella_design/features/schedule_order/screen/schedule_order.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/features/search_filter/screen/search_filter.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/serveMe/screens/companiesServices/companies_workshops_page.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/cars_services/carsServicespage.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/booking_confirmation_success.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/choise_a_technincal.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/confirm_reservation.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/homeServicespage.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/review_of_a_service.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/technical_details.dart';
import 'package:shella_design/features/serveMe/screens/individualsService/home_maintenance/technical_tracking.dart';
import 'package:shella_design/features/serveMe/screens/serveMePage.dart';
import 'package:shella_design/features/serveMe/screens/serve_product_screen.dart';
import 'package:shella_design/features/support_conversation/screens/support_conversation_screen.dart';
import 'package:shella_design/features/wallet/screens/wallet_screen.dart';
import 'package:shella_design/features/wallet_kaidha/screens/wallet_kaidha_screen.dart';
import 'package:shella_design/common/helper/check_Logged.dart';
import '../../api/api_client.dart';
import '../../features/Auth/domain/repositories/auth_repo.dart';
import '../../features/Auth/domain/services/auth_service.dart';
import '../../features/statistics/screens/statistics_screen.dart';
import '../util/Api_constants.dart';

class AppRoutes {
  static const String testPage = '/testPage';
  static const String scheduleOrderBottomSheet = '/scheduleOrderBottomSheet';
  static const String mainLayout = '/mainLayout';
  static const String splash = '/splash';
  static const String home = '/home';

  static const String Login_Mobile = '/Login_Mobile';

  static const String shops_screen = '/shops_screen';
  static const String hyper_screen = '/hyper_screen';
  static const String super_screen = '/super_screen';
  static const String product = '/product';
  static const String productDetails = '/product_details';
  static const String cartScreen = '/cart_screen';
  static const String cartDetails = '/cart_details';
  static const String ordersScreen = '/orders_screen';
  static const String step_one_service_screen = '/step_one_service_screen';
  static const String step_tow_service_screen = '/step_tow_service_screen';
  static const String address_details_service_screen = '/address_details_service_screen';
  static const String payment_screen = '/payment_screen';
  static const String payment_method_screen = '/payment_method_screen';
  static const String add_new_card_screen = '/add_new_card_screen';
  static const String statisticsScreen = '/statisticsScreen';
  static const String returnAndEarnScreen = '/returnAndEarnScreen';
  static const discountScreen = '/discountScreen';
  static const String walletScreen = '/walletScreen';
  static const String walletKaidhaScreen = '/walletKaidhaScreen';
  static const String myCouponScreen = '/myCouponScreen';
  static const String helpAndSupport = '/helpAndSupport';
  static const String joinAsDriverOne = '/joinAsDriverOne';
  static const String joinAsDriverTwo = '/joinAsDriverTwo';
  static const String supportConversation = '/supportConversation';
  static const String order_tracking = '/order_tracking';
  static const String start_tracking_order = '/start_tracking_order';
  static const String onBoarding = '/onboarding';
  static const String onBoarding_end = '/onBoarding_end';
  static const String splashscreen = '/splashscreen';
  static const String notifications = '/notifications';
  static const String searchfilter = '/searchfilter';
  static const String seveMePage = '/seveMePage';

  static const String signup = '/signup';
  static const String forgetpassword = '/forgetpassword';
  static const String mobilelVerification = '/mobilelVerification';
  static const String confirmPasswordScreen = '/confirmPasswordScreen';
  static const String passwordResetSuccessScreen = '/passwordResetSuccessScreen';
  static const String succsessflycreated = '/succsessflycreated';
  static const String orderdetails = '/orderdetails';
  static const String alfaressaudiarabiascreen = '/alfaressaudiarabiascreen';
  static const String alfaresOffersPage = '/alfaresOffersPage';
  static const String paymentDetailsPage = '/paymentDetailsPage';
  static const String accountdetails = '/accountdetails';
  static const String savedaddresses = '/savedaddresses';
  static const String myOrders = '/myOrders';
  //prifile Details
  static const String profileInfo = '/profile_info';
  static const String addressDetails = '/addressDetails';
  static const String addaddress = '/addaddress';

  // kaidha form
  static const String aliashtirakFiQaydiha = '/aliashtirakFiQaydiha';
  static const String verifySourceOfIncome = '/verifySourceOfIncome';

  // individualsService
  static const String homeservicespage = '/homeservicespage';
  static const String bookingConfirmationSuccess = '/bookingConfirmationSuccess';
  static const String companiesWorkshopsPage1 = '/companiesWorkshopsPage';
  static const String serveMeProductView = '/serveMeProductView';
  // static const String infoOfService = '/infoOfService';
  static const String confirmReservation = '/confirmReservation';
  // static const String serviceInfoPage = '/serviceInfoPage';
  static const String choiseATechnincal = '/choiseATechnincal';
  static const String technicianDetailsScreen = '/technicianDetailsScreen';
  static const String carsServicesPage = '/carsServicesPage';
  static const String technicalTracking = '/technicalTracking';
  static const String reviewOfAService = '/reviewOfAService';

  // Web =========================================================================================================

  static const String loginPage = "/login";
  static const String otpPage = "/otp";
  static const String contactUs = "/contactUs";
  static const String orderConfirmation = "/orderConfirmation";
  static const String orderConfirmationPage = "/orderConfirmationPage";
  static const String webHome = "/webHome";

  static const String howWasYourExperience = '/howWasYourExperience';
  static const String serviceProviders = '/serviceProviders';
  static const String serviceInformation = '/serviceInformation';
  static const String raiseAProblem = '/raiseAProblem';
  static const String service = '/service';
  static const String individualServices = '/individualServices';
  static const String selectService = '/selectService';
  static const String ordersTrackingPage = "/ordersTrackingPage";
  static const String ordersTrackingPage2 = "/ordersTrackingPage2";

  static const String webDeliveryServicePage = "/webDeliveryServicePage";
  static const String webDeliveryServicePage2 = "/webDeliveryServicePage2";
  static const String websenderinfo = "/websenderinfo";
  static const String oneWayDeliveryPage = "/oneWayDeliveryPage";
  static const String resturantPage = "/resturantPage";
  static const String companyService = '/companyService';
  static const String hyperShella = '/hyperShella';
  static const String foodDetialsPage = '/foodDetialsPage';
  static const String resturantSectionScreen = '/resturantSectionScreen';
  static const String superMarketFoodDetails = '/superMarketFoodDetails';
  static const String orderTracking = '/orderTracking';
  static const String companyMarketsShopes = '/companyMarketsShopes';
  static const String returantsDetailes = '/returantsDetailes';
  static const String termsAndConditionsScreen = '/termsAndConditionsScreen';

  // App =========================================================================================================

  static final Map<String, Widget Function(BuildContext)> routes = {
    // Main Layout
    mainLayout: (context) => const MainLayout(),
    scheduleOrderBottomSheet: (context) =>
        ChangeNotifierProvider(create: (_) => ScheduleController(), child: const ScheduleOrderBottomSheet()),
    // Auth
    Login_Mobile: (context) => Provider<AuthRepositoryInterface>(
          create: (context) => AuthRepo(
              apiClient: ApiClient(appBaseUrl: Api_Constants.appBaseUrl, sharedPreferences: sp<SharedPreferences>()),
              sharedPreferences: sp<SharedPreferences>()),
          child: Provider<AuthService>(
            create: (context) => AuthService(authRepositoryInterface: context.read<AuthRepositoryInterface>()),
            child: ChangeNotifierProvider<AuthController>(
                create: (context) => AuthController(authServiceInterface: context.read<AuthService>()), child: const Login_mobile()),
          ),
        ),

    signup: (context) => Provider<AuthRepositoryInterface>(
          create: (context) => AuthRepo(
            apiClient: ApiClient(
              appBaseUrl: Api_Constants.appBaseUrl,
              sharedPreferences: sp<SharedPreferences>(),
            ),
            sharedPreferences: sp<SharedPreferences>(),
          ),
          child: Provider<AuthService>(
            create: (context) => AuthService(authRepositoryInterface: context.read<AuthRepositoryInterface>()),
            child: ChangeNotifierProvider<AuthController>(
                create: (context) => AuthController(authServiceInterface: context.read<AuthService>()), child: const Signup()),
          ),
        ),
        //Discount
        discountScreen: (context) => const DiscountScreen(),
        //discountScreen: (context) => const DiscountScreen(),
//         discountScreen: (context) => ChangeNotifierProvider.value(
//   value: context.read<DiscountController>(), // جاي من MultiProvider
//   child: const DiscountScreen(),
// ),

//         discountScreen: (context) => ChangeNotifierProvider(
//   create: (_) => DiscountController(),
//   child: const DiscountScreen(),
// ),

    forgetpassword: (context) => const Forgetpassword(),
    mobilelVerification: (context) => const MobilelVerification(),
    confirmPasswordScreen: (context) => const ConfirmPasswordScreen(),
    passwordResetSuccessScreen: (context) => const PasswordResetSuccessScreen(),
    succsessflycreated: (context) => const Succsessflycreated(),

    // Home
    home: (context) => const Home_Screen(),
    shops_screen: (context) => const ShopsScreen(),
    hyper_screen: (context) => const HyperScreen(),
    super_screen: (context) => const SuperScreen(),

    // Product
    product: (context) => const ProductView(),
    productDetails: (context) => const ProductDetailsView(),

    // Cart
    cartScreen: (context) => ChangeNotifierProvider(
      create: (context) => CartController(cartService: CartService(cartRepository: CartRepository())),
      child: const Cart_Screen(),
    ),
    cartDetails: (context) => const CartDetailsScreen(),

    // Orders
    ordersScreen: (context) => const OrdersPage(),
    step_one_service_screen: (context) => const Step_One_Service_Screen(),
    step_tow_service_screen: (context) => const Step_Tow_Service_Screen(),
    address_details_service_screen: (context) => const Address_Details_Service_Screen(),
    order_tracking: (context) => ChangeNotifierProvider(create: (_) => OrderTrackingController(), child: const OrderTracking()),
    start_tracking_order: (context) =>
        ChangeNotifierProvider(create: (_) => StartTrackingOrderController(), child: const StartTrackingOrder()),
    orderdetails: (context) => ChangeNotifierProvider(
          create: (_) => OrderDetailsConroller(),
          child: const OrderDetails(),
        ),

    // Payment
    payment_screen: (context) => const Payment_Screen(),
    payment_method_screen: (context) => const Payment_Method_Screen(),
    add_new_card_screen: (context) => const Add_New_Card_Screen(),

    // Other Features
    statisticsScreen: (context) => const StatisticsScreen(),
    returnAndEarnScreen: (context) => const ReturnAndEarnScreen(),
   // discountScreen: (context) => const DiscountScreen(),
    walletScreen: (context) => const WalletScreen(),
    walletKaidhaScreen: (context) => const WalletKaidhaScreen(),
    myCouponScreen: (context) => const MyCouponScreen(),
    helpAndSupport: (context) => const HelpAndSupportScreen(),
    joinAsDriverOne: (context) => const JoinAsDriverOne(),
    joinAsDriverTwo: (context) => const JoinAsDriverTwo(),
    supportConversation: (context) => const SupportConversationScreen(),
    seveMePage: (context) => const Servemepage(),

    // Onboarding
    onBoarding: (context) => const OnBoarding(),
    onBoarding_end: (context) => const OnboardingEnd(),
    splashscreen: (context) => const SplashScreen(),

    // Notifications & Search
    notifications: (context) => const Notifications(),
    AppRoutes.searchfilter: (context) => ChangeNotifierProvider(
          create: (_) => SearchFilterController(),
          child: const SearchFilter(),
        ),

    //prifile Details
    profileInfo: (context) => const ProfileInfo (),
    addressDetails: (context) => MultiProvider(
          providers: [
            Provider<ProfileRepository>(
              create: (context) => ProfileRepository(),
            ),
            Provider<ProfileDetailsService>(
              create: (context) => ProfileDetailsService(
                profileRepository: context.read<ProfileRepository>(),
              ),
            ),
            ChangeNotifierProvider<ProfileController>(
              create: (context) => ProfileController(
                profileDetailsService: ProfileDetailsService(profileRepository: ProfileRepository()),
              ),
            ),
          ],
          child: const AddressDetailsPage(),
        ),
    addaddress: (context) => MultiProvider(
          providers: [
            Provider<ProfileRepository>(
              create: (context) => ProfileRepository(),
            ),
            Provider<ProfileDetailsService>(
              create: (context) => ProfileDetailsService(
                profileRepository: context.read<ProfileRepository>(),
              ),
            ),
            ChangeNotifierProvider<ProfileController>(
              create: (context) => ProfileController(
                profileDetailsService: ProfileDetailsService(profileRepository: ProfileRepository()),
              ),
            ),
          ],
          child: const AddNewAddressScreen(),
        ),

    // kaidha form
    AppRoutes.aliashtirakFiQaydiha: (context) => ChangeNotifierProvider(
          create: (_) => KaidhaFormController(),
          child: const AliashtirakFiQaydiha(),
        ),

    AppRoutes.verifySourceOfIncome: (context) => ChangeNotifierProvider(
          create: (_) => KaidhaFormController(),
          child: const VerifySourceOfIncome(),
        ),

    // individualsService
    homeservicespage: (context) => const Homeservicespage(),
    bookingConfirmationSuccess: (context) => const BookingConfirmationSuccess(),
    technicalTracking: (context) => const TechnicalTracking(),

    // infoOfService: (context) => const InfoOfService(),
    AppRoutes.confirmReservation: (context) => ChangeNotifierProvider(
          create: (_) => ServeMeController(),
          child: const ConfirmReservation(),
        ),
    // serviceInfoPage: (context) => const ServiceInfoPage(),
    choiseATechnincal: (context) => const ChoiseATechnincal(),
    companiesWorkshopsPage1: (context) => const CompaniesWorkshopsPage(),
    serveMeProductView: (context) => const ServeMeProductView(),
    technicianDetailsScreen: (context) => const TechnicianDetailsScreen(),
    carsServicesPage: (context) => const CarsServicesPage(),

    AppRoutes.reviewOfAService: (context) => ChangeNotifierProvider(
          create: (_) => ServeMeController(),
          child: const ReviewOfAService(),
        ),

    // Web =========================================================================================================

    loginPage: (context) => const LoginPage(),
    otpPage: (context) => OtpScreen(),
  };
}

//  pushNewScreen(AppRoutes.step_tow_service_screen);
