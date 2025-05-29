// ignore_for_file: constant_identifier_names, camel_case_types, file_names

class Api_Constants {
  // ======================== Url ========================

  static const String appBaseUrl = 'https://shalafood.net';
  static String token = 'guest';

  static String login = '/api/v1/auth/login';
  static String signup = '/api/v1/auth/sign-up';
  static const String guestId = '6ammart_guest_id';
  static String addresslist = '/api/v1/customer/address/list';
  static const String removeAddressUri =
      '/api/v1/customer/address/delete?address_id=';
  static const String addAddressUri = '/api/v1/customer/address/add';
  static const String updateAddressUri = '/api/v1/customer/address/update/';
  //static const String getDiscountedProducts = '/items/discounted?type=all&offset=2&limit=50';

  //

  /// Cart
  static const String getCartListUri = 'https://shalafood.net/api/v1/customer/cart/list';
  static const String addCartUri = '$appBaseUrl/api/v1/customer/cart/add';
  static const String updateCartUri = '$appBaseUrl/api/v1/customer/cart/update';
  static const String removeAllCartUri = '$appBaseUrl/api/v1/customer/cart/remove';
  static const String removeItemCartUri = '$appBaseUrl/api/v1/customer/cart/remove-item';

  static const String discountProducts = '/api/v1/items/discounted';
}
