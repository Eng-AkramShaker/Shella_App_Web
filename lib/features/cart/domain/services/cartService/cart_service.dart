import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../../models/cart_model.dart';
import '../../repositories/cartRepositoryInterface/cart_repository_interface.dart';
import '../cartServiceInterface/cart_service_interface.dart';

class CartService implements CartServiceInterface {
  final CartRepositoryInterface cartRepository;

  CartService({required this.cartRepository});

  @override
  Future<List<CartItem>> getCartItems() async {
    try {
      Response? response = await cartRepository.getCartItems();
      if (response!.statusCode == 200) {
        if (kDebugMode) {
          print(
              'Fetch Cart Items Response ::////////////////// from service getCartItems ////// ${response.body}');
        }
        // final responseData = jsonDecode(response.body); ////
        print("before /////////////////////////////");
        // final items = (responseData['items'] as List) ////
        //     .map<CartItem>((json) => CartItem.fromJson(json)) ////
        //     .toList(); ////
        final responseData = (jsonDecode(response.body)).map<CartItem>((json) {
          return CartItem.fromJson(json);
        }).toList();
        print("after /////////////////////////////");
        return responseData;
        // return items;

        ///
      } else {
        throw Exception(
            'Fetch Cart Items Failed/////////// /////// from service getCartItems //////');
      }
    } catch (e) {
      // if (kDebugMode) {
      //   print(
      //       'Fetch Cart Items Exception :: ////////////////// from service getCartItems //////${e.toString()}');
      // }
      throw Exception(
          'Fetch Cart Items Exception :: /%%%%%%%%%%%%%%%%%% from service getCartItems //////${e.toString()}');
    }
  }

  @override
  Future<void> addItemToCart({
    int? itemId,
    int? quantity,
    double? price,
    List<String>? variations,
    List<String>? addOns,
  }) async {
    try {
      if (kDebugMode) {
        print('Add To Cart Params :: itemId: $itemId, quantity: $quantity');
      }
      // final double price = await _getItemPrice(itemId);
      Response? response = await cartRepository.addToCart(
          itemId: itemId!,
          quantity: quantity!,
          price: price!,
          variations: variations,
          addOns: addOns);
      if (kDebugMode) {
        print('Add To Cart Response :: ${response!.body}');
      }
      if (response!.statusCode != 200) {
        throw Exception('Add To Cart Failed');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Add To Cart Exception :: ${e.toString()}');
      }
      throw Exception('Add To Cart Exception :: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      Response? response = await cartRepository.clearCart();
      if (kDebugMode) {
        print('Clear Cart Response :: ${response!.body}');
      }
      if (response!.statusCode != 200) {
        throw Exception('Clear Cart Failed');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Clear Cart Exception :: ${e.toString()}');
      }
      throw Exception('Clear Cart Exception :: ${e.toString()}');
    }
  }

  @override
  Future<void> removeCartItem(int itemId) async {
    try {
      Response? response = await cartRepository.removeCartItem(itemId);
      if (kDebugMode) {
        print('Remove From Cart Response :: ${response!.body}');
      }
      if (response!.statusCode != 200) {
        throw Exception('Remove From Cart Failed');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Remove From Cart Exception :: ${e.toString()}');
      }
      throw Exception('Remove From Cart Exception :: ${e.toString()}');
    }
  }

  @override
  Future<void> updateCartItem(int itemId, int quantity, double price) async {
    try {
      Response? response =
          await cartRepository.updateCartItem(itemId, quantity, price);
      if (kDebugMode) {
        print('Update Cart Response :: ${response!.body}');
      }
      if (response?.statusCode == 405) {
        throw Exception('Method not allowed. Please check API endpoint');
      }
      if (response!.statusCode != 200) {
        throw Exception('Update Cart Failed');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Update Cart Exception :: ${e.toString()}');
      }
      throw Exception('Update Cart Exception :: ${e.toString()}');
    }
  }
}
