import 'package:flutter/material.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';
import 'package:shella_design/features/cart/domain/services/cartServiceInterface/cart_service_interface.dart';

enum CartState { initial, loading, loaded, error }

class CartController extends ChangeNotifier {
  final CartServiceInterface cartService;

  CartState _state = CartState.initial;
  List<CartItem> _cartItems = [];
  String? _errorMessage;

  CartState get state => _state;
  List<CartItem> get cartItems => _cartItems;
  String? get errorMessage => _errorMessage;

  CartController({required this.cartService});

  Future<void> loadCartItems() async {
    _updateState(CartState.loading);
    try {
      _cartItems = await cartService.getCartItems();
      _updateState(CartState.loaded);
    } on Exception catch (e) {
      _errorMessage = e.toString();

      if (e.toString().contains('انتهت صلاحية الجلسة')) {
        // أضف منطق تسجيل الخروج هنا
        debugPrint('🚪 جارٍ تسجيل الخروج بسبب انتهاء الجلسة...');
      }

      _updateState(CartState.error);
    }
  }

  Future<void> addItem({
    required String itemId,
    required int quantity,
    List<String>? variations,
    List<String>? addOns,
  }) async {
    _updateState(CartState.loading);
    try {
      await cartService.addItemToCart(
        itemId: itemId,
        quantity: quantity,
        variations: variations,
        addOns: addOns,
      );
      await loadCartItems();
    } catch (e) {
      _errorMessage = e.toString();
      _updateState(CartState.error);
    }
  }

  Future<void> updateQuantity(String itemId, int newQuantity) async {
    _updateState(CartState.loading);
    try {
      await cartService.updateCartItem(itemId, newQuantity);
      await loadCartItems();
    } catch (e) {
      _errorMessage = e.toString();
      _updateState(CartState.error);
    }
  }

  Future<void> removeItem(String itemId) async {
    _updateState(CartState.loading);
    try {
      await cartService.removeCartItem(itemId);
      await loadCartItems();
    } catch (e) {
      _errorMessage = e.toString();
      _updateState(CartState.error);
    }
  }

  Future<void> clearAllItems() async {
    _updateState(CartState.loading);
    try {
      await cartService.clearCart();
      _cartItems = [];
      _updateState(CartState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _updateState(CartState.error);
    }
  }

  void _updateState(CartState newState) {
    _state = newState;
    notifyListeners();
  }
}
