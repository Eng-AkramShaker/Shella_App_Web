import '../../models/cart_model.dart';

abstract class CartServiceInterface {
  Future<List<CartItem>> getCartItems();

  Future<void> addItemToCart({
    int itemId,
    int quantity,
    double price,
    List<String>? variations,
    List<String>? addOns,
  });

  Future<void> updateCartItem(int itemId, int quantity, double price);

  Future<void> removeCartItem(int itemId);

  Future<void> clearCart();
}
