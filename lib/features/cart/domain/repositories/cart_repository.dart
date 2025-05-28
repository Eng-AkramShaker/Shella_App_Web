import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import '../models/cart_model.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(Map<String, dynamic> data);
  Future<void> updateCartItem(String itemId, int quantity);
  Future<void> removeCartItem(String itemId);
  Future<void> clearCart();
}

class CartRepositoryImpl implements CartRepository {
  final ApiClient apiClient;

  CartRepositoryImpl({required this.apiClient});

  @override
 Future<List<CartItem>> getCartItems() async {
  try {
    debugPrint('🟣 [Repository] جلب عناصر السلة...');
    
    // 1. تأكد من تحديث الـ headers أولاً
    apiClient.updateHeaders();
    
    // 2. أضف طباعة للتحقق من الـ headers
   // debugPrint('🔵 [Headers] ${apiClient.}');
    
    final response = await apiClient.getData(Api_Constants.getCartListUri);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      debugPrint('🟢 [Repository] تم استلام ${data.length} عنصر');
      return data.map((item) => CartItem.fromJson(item)).toList();
    } 
    else if (response.statusCode == 401) {
      debugPrint('🔴 [Repository] انتهت صلاحية Token، جارٍ تجديده...');
      // أضف هنا منطق تجديد الـ Token إذا كان متاحاً
      throw Exception('انتهت صلاحية الجلسة، يرجى إعادة تسجيل الدخول');
    }
    else {
      throw Exception('فشل جلب العناصر: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('🔴 [Repository Error] ${e.toString()}');
    rethrow;
  }}

  @override
  Future<void> addToCart(Map<String, dynamic> data) async {
    final response = await apiClient.postData(Api_Constants.addCartUri, data);
    if (response == null || response.statusCode != 200) {
      throw Exception('Failed to add item to cart');
    }
  }

  @override
  Future<void> updateCartItem(String itemId, int quantity) async {
    final response = await apiClient.putData(
      Api_Constants.updateCartUri,
      {'item_id': itemId, 'quantity': quantity},
    );
    if (response == null || response.statusCode != 200) {
      throw Exception('Failed to update cart item');
    }
  }

  @override
  Future<void> removeCartItem(String itemId) async {
    final response = await apiClient.deleteData(
      '${Api_Constants.removeItemCartUri}/$itemId',
    );
    if (response == null || response.statusCode != 200) {
      throw Exception('Failed to remove cart item');
    }
  }

  @override
  Future<void> clearCart() async {
    final response = await apiClient.deleteData(Api_Constants.removeAllCartUri);
    if (response == null || response.statusCode != 200) {
      throw Exception('Failed to clear cart');
    }
  }
}
