import 'package:http/http.dart' as http;

abstract class CartRepositoryInterface {

  Future<http.Response?> getCartItems();
  Future<http.Response?> addToCart({String itemId, int quantity, List<String>? variations, List<String>? addOns,});
  Future<http.Response?> updateCartItem(String itemId, int quantity);
  Future<http.Response?> removeCartItem(String itemId);
  Future<http.Response?> clearCart();

}
