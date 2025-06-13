// ignore_for_file: constant_identifier_names, camel_case_types, file_names

class Api_Constants {

  // ======================== Url ========================

  static const String appBaseUrl = 'https://shalafood.net';
  static String token = 'guest';

  static String login = '/api/v1/auth/login';
  static String signup = '/api/v1/auth/sign-up';
  static const String guestId = '6ammart_guest_id';
  static String addresslist = '/api/v1/customer/address/list';
  static const String removeAddressUri = '/api/v1/customer/address/delete?address_id=';
  static const String addAddressUri = '/api/v1/customer/address/add';
  static const String updateAddressUri = '/api/v1/customer/address/update/';

  //

  /// Cart
  static const String getCartListUri = '/customer/cart/list';
  static const String addCartUri = '/customer/cart/add';
  static const String updateCartUri = '/customer/cart/update';
  static const String removeAllCartUri = '/customer/cart/remove';
  static const String removeItemCartUri = '/customer/cart/remove-item';

  /// SEARCH ITEMS
  static const String searchItems = '/api/v1/items/item-or-store-search';

  /// MOST SEARCHED
  static const String mostSearched = '/api/v1/items/popular';

  /// CART PRODUCTS
  static const String cartProducts = '/api/v1/customer/cart/list';

  /// GET ADDRESS
  static const String getAddress = '/api/v1/customer/address/list';

  /// GET MY COUPON
  static const String getMyCoupon = '/api/v1/coupon/list';

  /// APPLY COUPON
  static const String applyCoupon = '/api/v1/coupon/apply';

  /// GET ALL CATEGORIES
  static const String getAllCategories = '/api/v1/categories';

  /// HOME CATEGORIES
  static const String homeCategories = '/api/v1/module';

  /// HOME BANNERS
  static const String homeBanners = '/api/v1/banners';

  /// POPULAR STORES
  static const String popularStores = '/api/v1/stores/popular';

  /// GET STORES
  static const String getStores = '/api/v1/stores/get-stores/all';

  /// GET ZONES
  static const String zones = '/api/v1/zone/list';

  /// STORE DETAILS
  static const String storeDetails = '/api/v1/stores/details/';
}