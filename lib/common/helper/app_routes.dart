// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/bottom_Navigation.dart';
import 'package:shella_design/features/Auth/screens/mobile/ConfirmPassword_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/forgetpassword_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/login_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/mobilelVerification_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/passwordResetSuccessScreen%20_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/signup_mobile.dart';
import 'package:shella_design/features/Auth/screens/mobile/succsessflyCreated_mobile.dart';
import 'package:shella_design/features/Auth/screens/web/login.dart';
import 'package:shella_design/features/Auth/screens/web/otp_screen.dart';
import 'package:shella_design/features/cart/screens/mobile/cart_details_screen.dart';
import 'package:shella_design/features/cart/screens/mobile/cart_screen.dart';
import 'package:shella_design/features/help_and_support/screens/mobile/help_and_support_mobile.dart';
import 'package:shella_design/features/home/home/mobile/home_screen.dart';
import 'package:shella_design/features/home/hyper/screens/hyper_screen.dart';
import 'package:shella_design/features/home/shops/screens/shops_screen.dart';
import 'package:shella_design/features/home/super/screens/super_screen.dart';
import 'package:shella_design/features/join_as_driver/screens/mobile/join_as_driver_one.dart';
import 'package:shella_design/features/join_as_driver/screens/mobile/join_as_driver_two.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/confirmation_order.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/driver_offers.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/looking_for_driver.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/negotiation_info.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/packet_position.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/receiver_info.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/service_details.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/tracking_pickup_order.dart';
import 'package:shella_design/features/pickup_and_order_service/screens/mobile/Instant_chat.dart';
import 'package:shella_design/features/restaurant/screens/mobile/restaurant_details.dart';

import 'package:shella_design/features/my_coupon/controllers/my_coupon_controller.dart';
import 'package:shella_design/features/my_coupon/domain/repositories/myCouponRepository/my_coupon_repositories.dart';
import 'package:shella_design/features/my_coupon/domain/services/myCouponService/my_coupon_services.dart';
import 'package:shella_design/features/my_coupon/screens/my_coupon_screen.dart';
import 'package:shella_design/features/notifications/notifications.dart';
import 'package:shella_design/features/onboarding/screen/onboarding.dart';
import 'package:shella_design/features/onboarding/screen/onboarding_end.dart';
import 'package:shella_design/features/onboarding/screen/splash_screen.dart';
import 'package:shella_design/features/orders/screens/order_screen/orders_page.dart';
import 'package:shella_design/features/orders/screens/service_screen/address_details_service.dart';
import 'package:shella_design/features/orders/screens/service_screen/step_one_service_screen.dart';
import 'package:shella_design/features/orders/screens/service_screen/step_tow_service_screen.dart';
import 'package:shella_design/features/orders_tracking/order_details/screen/order_details.dart';
import 'package:shella_design/features/orders_tracking/order_tracking/screen/order_tracking.dart';
import 'package:shella_design/features/orders_tracking/start_tracking_order/screen/start_tracking_order.dart';
import 'package:shella_design/features/payment/screens/add_New_card.dart';
import 'package:shella_design/features/payment/screens/payment.dart';
import 'package:shella_design/features/payment/screens/payment_method.dart';
import 'package:shella_design/features/product/screens/product_details_screen.dart';
import 'package:shella_design/features/restaurant/screens/mobile/restaurant_details.dart';
import 'package:shella_design/features/settings/screens/addNewAdress.dart';
import 'package:shella_design/features/settings/screens/adressDetailes.dart';
import 'package:shella_design/features/settings/screens/profile_info.dart';
import 'package:shella_design/features/return_and_earn/screens/return_and_earn_screen.dart';
import 'package:shella_design/features/search_filter/screen/search_filter.dart';
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
import 'package:shella_design/features/wallet_kaidha_subscription/screen/main_subscription.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/screen/show_pdf_screen.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/screen/subscription_steps/contract_review_screen.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/screen/subscription_steps/step1_screen.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/screen/wallet_kaidha_screen.dart';
import '../../features/help_and_support/screens/web/help_and_support_web.dart';
import '../../features/my_points/screens/mobile/my_points_screen_mobile.dart';
import '../../features/my_points/screens/my_points_transactions_screen.dart';
import '../../features/my_points/screens/web/my_points_web_widget.dart';
import '../../features/settings/screens/update_profile_info.dart';
import '../../features/search_filter/screen/web/search_filter_web.dart';
import '../../features/statistics/screens/statistics_screen.dart';
import '../widgets/profile/web/accountDetails/account_details.dart';

class AppRoutes {
  static const String testPage = '/testPage';
  static const String scheduleOrderBottomSheet = '/scheduleOrderBottomSheet';
  static const String mainLayout = '/mainLayout';
  static const String splash = '/splash';
  static const String home = '/home';

  static const String onBoarding = '/onboarding';
  static const String onBoarding_end = '/onBoarding_end';

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
  static const String address_details_service_screen =
      '/address_details_service_screen';
  static const String payment_screen = '/payment_screen';
  static const String payment_method_screen = '/payment_method_screen';
  static const String add_new_card_screen = '/add_new_card_screen';
  static const String statisticsScreen = '/statisticsScreen';
  static const String returnAndEarnScreen = '/returnAndEarnScreen';
  static const discountScreen = '/discountScreen';
  static const String walletScreen = '/walletScreen';

  static const String myCouponScreen = '/myCouponScreen';
  static const String helpAndSupportMobile = '/helpAndSupportMobile';
  static const String helpAndSupportWeb = '/helpAndSupportWeb';
  static const String helpAndSupport = '/helpAndSupport';
  static const String searchFilterWeb = '/searchFilterWeb';
  static const String joinAsDriverOne = '/joinAsDriverOne';
  static const String joinAsDriverTwo = '/joinAsDriverTwo';
  static const String supportConversation = '/supportConversation';
  static const String order_tracking = '/order_tracking';
  static const String start_tracking_order = '/start_tracking_order';

  static const String splashscreen = '/splashscreen';
  static const String notifications = '/notifications';
  static const String searchfilter = '/searchfilter';
  static const String seveMePage = '/seveMePage';
  static const String restaurantDetails = '/restaurantDetails';

  static const String signup = '/signup';
  static const String forgetpassword = '/forgetpassword';
  static const String mobilelVerification = '/mobilelVerification';
  static const String confirmPasswordScreen = '/confirmPasswordScreen';
  static const String passwordResetSuccessScreen =
      '/passwordResetSuccessScreen';
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
  static const String updateProfileInfoPage = '/update_profile_info_page';
  static const String addressDetails = '/addressDetails';
  static const String addAddress = '/addaddress';

  // kaidha
  static const String Contract_Review = '/contract_review_screen';
  static const String main_subscription = '/main_subscription';
  static const String walletKaidha_Step_1_Screen =
      '/walletKaidha_Step_1_Screen';
  static const String kaidhaWallet = '/kaidha-allet';

  // individualsService
  static const String homeservicespage = '/homeservicespage';
  static const String bookingConfirmationSuccess =
      '/bookingConfirmationSuccess';
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
  static const String myPointsTransactionsScreen =
      '/myPointsTransactionsScreen';
  static const String myPointsWeb = '/myPointsWeb';
  static const String myPointsMobile = 'myPointsMobile';

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
  static const String packetsPosition = '/packetsPosition';
  static const String receiverInfo = '/receiverInfo';
  static const String driverOffers = '/driverOffers';
  static const String negotiationInfo = '/negotiationInfo';
  static const String confirmationOrder = '/confirmationOrder';
  static const String trackingPickUpOrder = '/trackingPickUpOrder';
  static const String instantChat = '/instantChat';
  static const String pickupServiceDetails = '/pickupServiceDetails';
  static const String lookingForDriver = '/lookingForDriver';

  // App =========================================================================================================

  static final Map<String, Widget Function(BuildContext)> routes = {
    mainLayout: (context) => const MainLayout(),

    // Auth
    Login_Mobile: (context) => const Login_mobile(),
    signup: (context) => const Signup(),
    forgetpassword: (context) => const Forgetpassword(),
    mobilelVerification: (context) => const MobilelVerification(),
    confirmPasswordScreen: (context) => const ConfirmPasswordScreen(),
    passwordResetSuccessScreen: (context) => const PasswordResetSuccessScreen(),
    succsessflycreated: (context) => const Succsessflycreated(),

    // Home
    home: (context) => const HomeView(),
    shops_screen: (context) => const ShopsScreen(),
    hyper_screen: (context) => const HyperScreen(),
    super_screen: (context) => const SuperScreen(),

    // Product
    productDetails: (context) => const ProductDetailsView(),

    // Cart
    cartScreen: (context) => const Cart_Screen(),
    cartDetails: (context) => const CartDetailsScreen(),

    // Orders
    ordersScreen: (context) => const OrdersPage(),
    step_one_service_screen: (context) => const Step_One_Service_Screen(),
    step_tow_service_screen: (context) => const Step_Tow_Service_Screen(),
    address_details_service_screen: (context) =>
        const Address_Details_Service_Screen(),
    order_tracking: (context) => const OrderTracking(),
    start_tracking_order: (context) => const StartTrackingOrder(),
    orderdetails: (context) => const OrderDetails(),

    // Payment
    payment_screen: (context) => const Payment_Screen(),
    payment_method_screen: (context) => const Payment_Method_Screen(),
    add_new_card_screen: (context) => const Add_New_Card_Screen(),

    // Other Features
    statisticsScreen: (context) => const StatisticsScreen(),
    returnAndEarnScreen: (context) => const ReturnAndEarnScreen(),
    walletScreen: (context) => const WalletScreen(),

    // Kaidha
    Contract_Review: (context) => const Contract_ReviewScreen(),
    main_subscription: (context) => const KiadaWalletSubscriptionScreen(),
    walletKaidha_Step_1_Screen: (context) => const Step_1_Screen(),
    kaidhaWallet: (context) => const WalletKaidhaScreen(),

    helpAndSupport: (context) => const HelpAndSupport(),

    joinAsDriverOne: (context) => JoinAsDriverOne(),
    helpAndSupportMobile: (context) => const HelpAndSupportScreen(),
    joinAsDriverTwo: (context) => const JoinAsDriverTwo(),
    supportConversation: (context) => const SupportConversationScreen(),
    seveMePage: (context) => const Servemepage(),

    // Onboarding
    onBoarding: (context) => const OnBoarding(),
    onBoarding_end: (context) => const OnboardingEnd(),
    splashscreen: (context) => const SplashScreen(),

    // Notifications & Search
    notifications: (context) => const Notifications(),
    searchfilter: (context) => const SearchFilter(),

    // Profile
    profileInfo: (context) => const ProfileInfo(),
    updateProfileInfoPage: (context) => const UpdateProfileInfoPage(),
    addressDetails: (context) => const AddressDetailsPage(),
    addAddress: (context) => const AddNewAddressScreen(),

    // Services
    homeservicespage: (context) => const Homeservicespage(),
    bookingConfirmationSuccess: (context) => const BookingConfirmationSuccess(),
    technicalTracking: (context) => const TechnicalTracking(),
    confirmReservation: (context) => const ConfirmReservation(),
    choiseATechnincal: (context) => const ChoiseATechnincal(),
    companiesWorkshopsPage1: (context) => const CompaniesWorkshopsPage(),
    serveMeProductView: (context) => const ServeMeProductView(),
    technicianDetailsScreen: (context) => const TechnicianDetailsScreen(),
    carsServicesPage: (context) => const CarsServicesPage(),
    reviewOfAService: (context) => const ReviewOfAService(),

    // My Coupon & Points
    myCouponScreen: (context) => const MyCouponScreen(),
    myPointsTransactionsScreen: (context) =>
        MyPointsTransactionsScreen(fromNotification: false),
    myPointsMobile: (context) => MyPointsScreenMobile(),

    //Restaurant

    restaurantDetails: (context) => RestaurantDetails(),

    // Pickup and order Service
    packetsPosition: (context) => PacketsPosition(),
    driverOffers: (context) => DriverOffers(),
    negotiationInfo: (context) => NegotiationInfo(),
    confirmationOrder: (context) => ConfirmationOrder(),
    trackingPickUpOrder: (context) => TrackingPickUpOrder(),
    instantChat: (context) => InstantChat(),
    pickupServiceDetails: (context) => ServiceDetails(),
    lookingForDriver: (context) => LookingForDriver(),
    //  receiverInfo: (context) => ReceiverInfo(),

    // Web
    loginPage: (context) => const LoginPage(),
    otpPage: (context) => OtpScreen(),
    helpAndSupportWeb: (context) => HelpAndSupport(),
    accountdetails: (context) => const AccountDetails(),
    searchFilterWeb: (context) => const SearchFilterWeb(),
    myPointsWeb: (context) => MyPointsWebWidget(),
  };
}
