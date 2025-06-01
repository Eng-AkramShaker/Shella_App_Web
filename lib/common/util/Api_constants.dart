// ignore_for_file: constant_identifier_names, camel_case_types, file_names

class Api_Constants {
  static const Map<String, String> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static const String authorizationToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWM4NTc5M2I2ODJjMWJkOTUyM2M3NTg2Yzc2Y2ZmYzY3ZDgzMjJlN2Q2MTg0ODUzM2Y2MDQ0ODM0MTM4YWE2NmRlMTkyM2UzODYzZTBhNjYiLCJpYXQiOjE3NDY5ODEwNzkuMjAyNTQ2LCJuYmYiOjE3NDY5ODEwNzkuMjAyNTQ5LCJleHAiOjE3Nzg1MTcwNzkuMTk1MzQ1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.zPgBMHuEUV7bmsuKKZr4Rfzpb6DdsE3mp0-B4R4NnOAGhYAeU0jd_fCzlysfXX1L9VDppE-JQgVqe4TSKR1g8vzwhtQcGdKxJin6gO0werfVBCZNO1AqsDjtHzFx3sudqZSbnRamjPbEAUpDpcSV5vrMWXEGqgtO9qcPNQ_lrM0ED3Bto1P8XmUZlvpeIFnc9faS1Mt87P8dJ_ERxkgYQJbzEmAm0sr7s6DT6o5P_c__MqxSjPC-JIxb3xfXCJWjGNshm24mdJNrhxes4Uy8Cp6nUaLp073SfUHgYuO6wHG_QcY_YHzdkObEEAuGUz8YWP8QfuTFCGJIzTdQlkufrKTyhyDJlffT9nKEZXb1IT1DasrOgrTzwGIUL2AW2HJqjdrTf0Lfd5q9HwCpwRwHwNNY3Xx7SqS1E8dHtMrsdcu_Tqc1d6NC4XGjK97OjDtu1Z_Y8XKIsnmcl8poKT7UvFVSrIT0dy7IglXmlzNZcQnjZa5LTGdMWoJRKrJkl9rFi_M7SGKKPfo0pgtWdVa0J25YrEqUv3MB9-0lpuVNpYK3xu3lojbFzRpjtagCby_JKUorpnWc_QzIsGj8uL9ToziOBevdn_b7UNtsf3B99-XgAX2Do3XxMMCjwwEG-zeDGlE4hn-wk_vqmsfXkVNtOR8RpkIRr7dRHsz68smno1IE';

  // ======================== Base URLs ========================
  static const String appBaseUrl = 'https://admin.shalafood.net';
  static const String apiBaseUrl = 'https://shalafood.net/api/v1';
  static String token = 'guest';

  // ======================== Auth ========================
  static const String login = '/api/v1/auth/login';
  static const String signup = '/api/v1/auth/sign-up';
  static const String guestId = '6ammart_guest_id';

  // ======================== Address ========================
  static const String addressList = '/api/v1/customer/address/list';
  static const String addAddressUri = '/api/v1/customer/address/add';
  static const String updateAddressUri = '/api/v1/customer/address/update/';
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
}
