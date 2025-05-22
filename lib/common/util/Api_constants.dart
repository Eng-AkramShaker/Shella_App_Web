// ignore_for_file: constant_identifier_names, camel_case_types, file_names

class Api_Constants {
  // ======================== Url ========================

  static const String appBaseUrl = 'https://shalafood.net';
  static String token = 'guest';

  static String login = '/api/v1/auth/login';
  static String signup = '/api/v1/auth/sign-up';
  static const String addFund = '/api/v1/customer/wallet/add-fund';
  static const String guestId = '6ammart_guest_id';
  static String addresslist = '/api/v1/customer/address/list';
  static const String removeAddressUri =
      '/api/v1/customer/address/delete?address_id=';
  static const String addAddressUri = '/api/v1/customer/address/add';
  static const String updateAddressUri = '/api/v1/customer/address/update/';

  //

  /// Cart
  static const String getCartListUri = '/customer/cart/list';
  static const String addCartUri = '/customer/cart/add';
  static const String updateCartUri = '/customer/cart/update';
  static const String removeAllCartUri = '/customer/cart/remove';
  static const String removeItemCartUri = '/customer/cart/remove-item';
}
