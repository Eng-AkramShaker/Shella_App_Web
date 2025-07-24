import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/cart/domain/repositories/cartRepositoryInterface/cart_repository_interface.dart';
import '../../../../../common/helper/check_Logged.dart';
import '../../../../../common/util/sharedPre_constants.dart';

class CartRepository implements CartRepositoryInterface {
  final ApiClient apiClient;

  CartRepository({required this.apiClient});

  @override
  Future<http.Response?> getCartItems() async {
    final newHeader = {...apiClient.getHeader(), "moduleId": "3"};

    Response? response = await ApiClient(

      sharedPreferences: sp<SharedPreferences>(),
    ).getData(ApiConstants.getCartListUri, headers: newHeader);
    return response;
  }

  @override
  Future<http.Response?> addToCart({
    int? itemId,
    int? quantity,
    double? price,
    List<String>? variations,
    List<String>? addOns,
  }) async {
    Response? response = await ApiClient(

        sharedPreferences: sp<SharedPreferences>())
        .postData('${ApiConstants.addCartUri}?cart_id=$itemId', {
      'item_id': itemId,
      'quantity': quantity,
      'price': price,
      'variation': variations ?? [],
      'add_ons': addOns ?? [],
    });
    return response;
  }

  @override
  Future<http.Response?> updateCartItem(
      int itemId, int quantity, double price) async {
    final newHeader = {...apiClient.getHeader(), "moduleId": "3"};
    Response? response = await ApiClient(

        sharedPreferences: sp<SharedPreferences>())
        .postData('${ApiConstants.updateCartUri}?cart_id=$itemId',
        {'quantity': quantity, 'price': price},
        headers: newHeader);
    return response;
  }

  @override
  Future<http.Response?> removeCartItem(int itemId) async {
    print(
        '//////////////////////////////////////${ApiConstants.removeItemCartUri}?cart_id=$itemId ');
    Response? response = await ApiClient(

        sharedPreferences: sp<SharedPreferences>())
        .deleteData('${ApiConstants.removeItemCartUri}?cart_id=$itemId');

    print(
        '//////////////////////////////////////${ApiConstants.removeItemCartUri}?cart_id=$itemId ');
    return response;
  }

  @override
  Future<http.Response?> clearCart() async {
    Response? response = await ApiClient(

        sharedPreferences: sp<SharedPreferences>())
        .deleteData(ApiConstants.removeItemCartUri);
    return response;
  }
}