import '../models/cart_model.dart';
import '../repositories/cart_repository.dart';

class CartService {
  final CartRepository cartRepository;

  CartService({required this.cartRepository});

  Future<List<CartItem>> getCartItems() => cartRepository.getCartItems();

  Future<void> addItemToCart({
    required String itemId,
    required int quantity,
    List<String>? variations,
    List<String>? addOns,
  }) async {
    await cartRepository.addToCart({
      'item_id': itemId,
      'quantity': quantity,
      'variation': variations,
      'add_ons': addOns,
    });
  }

  Future<void> updateItemQuantity(String itemId, int newQuantity) =>
      cartRepository.updateCartItem(itemId, newQuantity);

  Future<void> removeItem(String itemId) =>
      cartRepository.removeCartItem(itemId);

  Future<void> clearCart() => cartRepository.clearCart();
}
