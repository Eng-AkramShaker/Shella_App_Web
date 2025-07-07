import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/cart/domain/repositories/cartRepositoryInterface/cart_repository_interface.dart';
import '../../../../../common/helper/check_Logged.dart';

class CartRepository implements CartRepositoryInterface {

  @override
 Future<http.Response?> getCartItems() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.getCartListUri);
    return response;
  }

  @override
  Future<http.Response?> addToCart({String? itemId, int? quantity, List<String>? variations, List<String>? addOns,}) async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).postData(Api_Constants.addCartUri,
        {
          'item_id': itemId,
          'quantity': quantity,
          'variation': variations,
          'add_ons': addOns,
        });
    return response;
  }

  @override
  Future<http.Response?> updateCartItem(String itemId, int quantity) async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).putData(Api_Constants.updateCartUri, {'item_id': itemId, 'quantity': quantity});
    return response;
  }

  @override
  Future<http.Response?> removeCartItem(String itemId) async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).deleteData('${Api_Constants.removeItemCartUri}/$itemId');
    return response;
  }

  @override
  Future<http.Response?> clearCart() async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).deleteData(Api_Constants.removeItemCartUri);
    return response;
  }
}
