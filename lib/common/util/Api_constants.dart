// ignore_for_file: constant_identifier_names, camel_case_types, file_names

class Api_Constants {
  // ======================== Url ========================
  static const String appBaseUrl = 'https://shalafood.net';

  static String token = 'guest';

  static String customerInfo = '$appBaseUrl/api/v1/customer/info';
  static String joinAsDriver = '$appBaseUrl/api/v1/auth/delivery-man/store';

  static String login = '/api/v1/auth/login';
  static String signup = '/api/v1/auth/sign-up';
  static const String forgetPasswordUri = '/api/v1/auth/forgot-password';
  static const String verifyPhoneUri = '/api/v1/auth/verify-phone';
  static const String resetPasswordUri = '/api/v1/auth/reset-password';
  //
  static const String guestId = '6ammart_guest_id';
  static String addresslist = '/api/v1/customer/address/list';
  static const String removeAddressUri = '/api/v1/customer/address/delete?address_id=';
  static const String addAddressUri = '/api/v1/customer/address/add';
  static const String updateAddressUri = '/api/v1/customer/address/update/';

  //

  /// Cart
  static const String getCartListUri = 'https://shalafood.net/api/v1/customer/cart/list';
  static const String addCartUri = '$appBaseUrl/api/v1/customer/cart/add';
  static const String updateCartUri = '$appBaseUrl/api/v1/customer/cart/update';
  static const String removeAllCartUri = '$appBaseUrl/api/v1/customer/cart/remove';
  static const String removeItemCartUri = '$appBaseUrl/api/v1/customer/cart/remove-item';

  static const String discountProducts = '/api/v1/items/discounted';

  /// GET ADDRESS
  static const String getAddress = '/api/v1/customer/address/list';

  /// GET MY COUPON
  static const String getMyCoupon = '/api/v1/coupon/list';

  /// APPLY COUPON
  static const String applyCoupon = '/api/v1/coupon/apply';

  /// GET ALL CATEGORIES
  static const String getAllCategories = '/api/v1/categories';

  /// SEARCH ITEMS
  static const String searchItems = '/api/v1/items/item-or-store-search';

  /// MOST SEARCHED
  static const String mostSearched = '/api/v1/items/popular';

  /// CART PRODUCTS
  static const String cartProducts = '/api/v1/customer/cart/list';

  static const String pointsConversionUri = '/api/v1/customer/loyalty-point/point-transfer';

  static const String customerInfoUri = '/api/v1/customer/info';

  static const String pointsTransactionsUri = '/api/v1/customer/loyalty-point/transactions';

  static const String couponListUri = '/api/v1/coupon/list';

  static const String configUri = '/api/v1/config';
  //Orders
  static const String runningOrderListUri = '/api/v1/customer/order/running-orders';
  static const String historyOrderListUri = '/api/v1/customer/order/list';
}
