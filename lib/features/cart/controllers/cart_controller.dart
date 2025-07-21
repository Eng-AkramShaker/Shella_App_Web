import 'package:flutter/material.dart';
import 'package:shella_design/features/cart/domain/models/cart_model.dart';
import 'package:shella_design/features/cart/domain/services/cartServiceInterface/cart_service_interface.dart';

enum CartState { initial, loading, loaded, error }

class CartController extends ChangeNotifier {
  final CartServiceInterface cartService;

  CartState _state = CartState.initial;
  List<CartItem> _cartItems = [];
  String? _errorMessage;
  double _subtotal = 0.0;
  double _tax = 0.0;
  int? cartItemCont;

  // double _total = 0.0;
  CartItem? _selectedItem;
  Map<int, bool> _updatingItems = {};
  Map<int, bool> _itemLoading = {};
  final double _delivery = 15.0;
  Map<int, int> _tempQuantities = {};
  Map<int, String> _tempNotes = {};

  /// Getters
  CartItem? get selectedItem => _selectedItem;

  double get tax => _tax;

  double get subtotal => _subtotal;

  Map<int, bool> get itemLoading => _itemLoading;

  CartState get state => _state;

  List<CartItem> get cartItems => _cartItems;

  String? get errorMessage => _errorMessage;

  double get delivery => _delivery;

  double get total => _subtotal + _tax + _delivery;

  int get cartItemCount => _cartItems.length;

  // double get total => _total;

  CartController({required this.cartService});

  bool isUpdating(int itemId) => _updatingItems[itemId] ?? false;

  void setTempQuantity(int itemId, int quantity) {
    _tempQuantities[itemId] = quantity;
    notifyListeners();
  }

  int getTempQuantity(int itemId) {
    return _tempQuantities[itemId] ??
        _cartItems.firstWhere((e) => e.id == itemId).quantity ??
        1;
  }

  void setTempNote(int itemId, String note) {
    _tempNotes[itemId] = note;
    notifyListeners();
  }

  String getTempNote(int itemId) {
    return _tempNotes[itemId] ?? '';
  }

  void increaseTempQuantity(int itemId) {
    final current = getTempQuantity(itemId);
    final stock = _cartItems.firstWhere((e) => e.id == itemId).item?.stock ?? 0;
    if (current < stock) {
      setTempQuantity(itemId, current + 1);
    }
  }

  void decreaseTempQuantity(int itemId) {
    final current = getTempQuantity(itemId);
    if (current > 1) {
      setTempQuantity(itemId, current - 1);
    }
  }

  /// Get Selected Item
  void selectItem(CartItem item) {
    _selectedItem = item;
    notifyListeners();
  }

  void setItemLoading(int itemId, bool value) {
    _itemLoading[itemId] = value;
    notifyListeners();
  }

  void getCartItemCount() {
    cartItemCont = _cartItems.length;
    notifyListeners();
  }

  Future<void> loadCartItems() async {
    _updateState(CartState.loading);
    try {
      _cartItems = await cartService.getCartItems();
      _updateState(CartState.loaded);
      _subtotal = _cartItems.fold(
          0, (sum, item) => sum + (item.price! * item.quantity!));
      final uniqueItemTaxes = _cartItems.map((e) => e.item?.tax ?? 0.0).toSet();
      _tax = uniqueItemTaxes.fold(0.0, (sum, t) => sum + t);
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
    required int itemId,
    required int quantity,
    required double price,
    List<String>? variations,
    List<String>? addOns,
  }) async {
    _updateState(CartState.loading);
    try {
      await cartService.addItemToCart(
        itemId: itemId,
        quantity: quantity,
        price: price,
        variations: variations,
        addOns: addOns,
      );
      await loadCartItems();
    } catch (e) {
      _errorMessage = e.toString();
      _updateState(CartState.error);
    }
  }

  Future<void> updateQuantity(int itemId, int newQuantity, double price) async {
    // _updateState(CartState.loading);
    _updatingItems[itemId] = true;
    notifyListeners();
    try {
      await cartService.updateCartItem(itemId, newQuantity, price);
      await loadCartItems();
    } catch (e) {
      _errorMessage = e.toString();
      _updateState(CartState.error);
    } finally {
      _updatingItems[itemId] = false;
      notifyListeners();
    }
  }

  void updateItemQuantity(int index, int newQuantity) {
    final item = _cartItems[index];
    // _cartItems[index].quantity = newQuantity;
    _cartItems[index] = item.copyWith(quantity: newQuantity);
    _subtotal =
        _cartItems.fold(0, (sum, item) => sum + (item.price! * item.quantity!));
    notifyListeners();
  }

  Future<void> increaseQuantity(int itemId) async {
    final index = _cartItems.indexWhere((item) => item.id == itemId);
    if (index == -1) return;

    final item = _cartItems[index];
    final currentQuantity = item.quantity ?? 1;
    final stock = item.item?.stock ?? 0;

    if (currentQuantity < stock) {
      setItemLoading(item.id!, true);
      await updateQuantity(item.id!, currentQuantity + 1, item.price!);
      setItemLoading(item.id!, false);
    }
  }

  Future<void> decreaseQuantity(int itemId) async {
    final index = _cartItems.indexWhere((item) => item.id == itemId);
    if (index == -1) return;

    final item = _cartItems[index];
    final currentQuantity = item.quantity ?? 1;

    if (currentQuantity > 1) {
      setItemLoading(item.id!, true);
      await updateQuantity(item.id!, currentQuantity - 1, item.price!);
      setItemLoading(item.id!, false);
    }
  }

  Future<void> removeItem(int itemId) async {
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
      _subtotal = 0.0;
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
