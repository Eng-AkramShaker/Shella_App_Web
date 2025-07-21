import 'package:http/http.dart' as http;

abstract class CartRepositoryInterface {
  Future<http.Response?> getCartItems();

  Future<http.Response?> addToCart({
    int itemId,
    int quantity,
    double price,
    List<String>? variations,
    List<String>? addOns,
  });

  Future<http.Response?> updateCartItem(int itemId, int quantity, double price);

  Future<http.Response?> removeCartItem(int itemId);

  Future<http.Response?> clearCart();
}
