import '../../models/cart_model.dart';

abstract class CartServiceInterface {

  Future<List<CartItem>> getCartItems();
  Future<void> addItemToCart({String itemId, int quantity, List<String>? variations, List<String>? addOns,});
  Future<void> updateCartItem(String itemId, int quantity);
  Future<void> removeCartItem(String itemId);
  Future<void> clearCart();

}