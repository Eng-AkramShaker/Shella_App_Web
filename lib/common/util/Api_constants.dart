// ignore_for_file: constant_identifier_names, camel_case_types, file_names

class Api_Constants {
  static const Map<String, String> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static const String authorizationToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWM4NTc5M2I2ODJjMWJkOTUyM2M3NTg2Yzc2Y2ZmYzY3ZDgzMjJlN2Q2MTg0ODUzM2Y2MDQ0ODM0MTM4YWE2NmRlMTkyM2UzODYzZTBhNjYiLCJpYXQiOjE3NDY5ODEwNzkuMjAyNTQ2LCJuYmYiOjE3NDY5ODEwNzkuMjAyNTQ5LCJleHAiOjE3Nzg1MTcwNzkuMTk1MzQ1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.zPgBMHuEUV7bmsuKKZr4Rfzpb6DdsE3mp0-B4R4NnOAGhYAeU0jd_fCzlysfXX1L9VDppE-JQgVqe4TSKR1g8vzwhtQcGdKxJin6gO0werfVBCZNO1AqsDjtHzFx3sudqZSbnRamjPbEAUpDpcSV5vrMWXEGqgtO9qcPNQ_lrM0ED3Bto1P8XmUZlvpeIFnc9faS1Mt87P8dJ_ERxkgYQJbzEmAm0sr7s6DT6o5P_c__MqxSjPC-JIxb3xfXCJWjGNshm24mdJNrhxes4Uy8Cp6nUaLp073SfUHgYuO6wHG_QcY_YHzdkObEEAuGUz8YWP8QfuTFCGJIzTdQlkufrKTyhyDJlffT9nKEZXb1IT1DasrOgrTzwGIUL2AW2HJqjdrTf0Lfd5q9HwCpwRwHwNNY3Xx7SqS1E8dHtMrsdcu_Tqc1d6NC4XGjK97OjDtu1Z_Y8XKIsnmcl8poKT7UvFVSrIT0dy7IglXmlzNZcQnjZa5LTGdMWoJRKrJkl9rFi_M7SGKKPfo0pgtWdVa0J25YrEqUv3MB9-0lpuVNpYK3xu3lojbFzRpjtagCby_JKUorpnWc_QzIsGj8uL9ToziOBevdn_b7UNtsf3B99-XgAX2Do3XxMMCjwwEG-zeDGlE4hn-wk_vqmsfXkVNtOR8RpkIRr7dRHsz68smno1IE';

<<<<<<< HEAD
  static const String appBaseUrl = 'https://shalafood.net';
  static String token = 'guest';

  static String login = '/api/v1/auth/login';
  static String signup = '/api/v1/auth/sign-up';
  static const String forgetPasswordUri = '/api/v1/auth/forgot-password';
  static const String verifyPhoneUri = '/api/v1/auth/verify-phone';
  static const String resetPasswordUri = '/api/v1/auth/reset-password';
  //
=======
  // ======================== Base URLs ========================
  static const String appBaseUrl = 'https://admin.shalafood.net';
  static const String apiBaseUrl = 'https://shalafood.net/api/v1';
  static String token = 'guest';

  // ======================== Auth ========================
  static const String login = '/api/v1/auth/login';
  static const String signup = '/api/v1/auth/sign-up';
>>>>>>> cbf245c5eb9111054d49dcebfa146b6a1ee73b83
  static const String guestId = '6ammart_guest_id';

  // ======================== Address ========================
  static const String addressList = '/api/v1/customer/address/list';
  static const String addAddressUri = '/api/v1/customer/address/add';
  static const String updateAddressUri = '/api/v1/customer/address/update/';
<<<<<<< HEAD
  //static const String getDiscountedProducts = '/items/discounted?type=all&offset=2&limit=50';

  //

  /// Cart
  static const String getCartListUri =
      'https://shalafood.net/api/v1/customer/cart/list';
  static const String addCartUri = '$appBaseUrl/api/v1/customer/cart/add';
  static const String updateCartUri = '$appBaseUrl/api/v1/customer/cart/update';
  static const String removeAllCartUri =
      '$appBaseUrl/api/v1/customer/cart/remove';
  static const String removeItemCartUri =
      '$appBaseUrl/api/v1/customer/cart/remove-item';

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

  static const String pointsConversionUri =
      '/api/v1/customer/loyalty-point/point-transfer';

  static const String customerInfoUri = '/api/v1/customer/info';

  static const String pointsTransactionsUri =
      '/api/v1/customer/loyalty-point/transactions';

  static const String couponListUri = '/api/v1/coupon/list';

  static const String configUri = '/api/v1/config';
=======
  static const String removeAddressUri =
      '/api/v1/customer/address/delete?address_id=';

  // ======================== Cart ========================
  static const String getCartListUri = '/customer/cart/list';
  static const String addCartUri = '/customer/cart/add';
  static const String updateCartUri = '/customer/cart/update';
  static const String removeAllCartUri = '/customer/cart/remove';
  static const String removeItemCartUri = '/customer/cart/remove-item';

  // ======================== Store & Product ========================
  static String storeDetails(int storeId) => '/stores/details/$storeId';
  static const String latestProducts = '/items/latest';
  static const String getAllStoresUri = '/stores/get-stores/all';

  // Home
  static const String banners = '/banners';
  static const String categories = '/categories';
>>>>>>> cbf245c5eb9111054d49dcebfa146b6a1ee73b83
}
