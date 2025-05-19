import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/features/Favorite/domain/models/features_model.dart';

class FavoriteRepository {
  final ApiClient apiClient;

  FavoriteRepository({required this.apiClient});

  static const String wishListGetUri = '/api/v1/customer/wish-list';
  static const String addWishListUri = '/api/v1/customer/wish-list/add';
  static const String removeWishListUri = '/api/v1/customer/wish-list/remove';

  Future<FavoriteModel?> getFavoriteList() async {
    try {
      debugPrint('Getting favorite list from: $wishListGetUri');
      
      final response = await apiClient.getData(
        wishListGetUri, 
        forceRefreshToken: true,
        attemptTokenRefresh: true
      );

      if (response != null) {
        try {
          final Map<String, dynamic> jsonData = jsonDecode(response.body);
          debugPrint('Successfully parsed favorite data');
          return FavoriteModel.fromJson(jsonData);
        } catch (e) {
          debugPrint('Error parsing favorite JSON response: $e');
          return null;
        }
      } else {
        debugPrint('Failed to load favorites - null response');
        return null;
      }
    } catch (e) {
      debugPrint('Error getting favorite list: $e');
      return null;
    }
  }

  Future<bool> addToFavoriteList(int? itemId, int? storeId) async {
    try {
      if (itemId == null && storeId == null) {
        debugPrint('Error: Both itemId and storeId are null');
        return false;
      }

      Map<String, dynamic> query = {};
      if (itemId != null) {
        query['item_id'] = itemId.toString();
        debugPrint('Adding item ID: $itemId to favorites');
      } else if (storeId != null) {
        query['store_id'] = storeId.toString();
        debugPrint('Adding store ID: $storeId to favorites');
      }

      // تحديث الهيدرز قبل الطلب للتأكد من استخدام أحدث توكن
      final response = await apiClient.getData(
        addWishListUri, 
        query: query, 
        forceRefreshToken: true,
        attemptTokenRefresh: true
      );

      if (response != null) {
        debugPrint('Successfully added to favorites');
        return true;
      }

      debugPrint('Failed to add to favorites - null response');
      return false;
    } catch (e) {
      debugPrint('Error adding to favorite list: $e');
      return false;
    }
  }

  Future<bool> removeFromFavoriteList(int id, bool isStore) async {
    try {
      String uri = removeWishListUri;
      
      if (isStore) {
        uri += '?store_id=$id';
        debugPrint('Removing store ID: $id from favorites');
      } else {
        uri += '?item_id=$id';
        debugPrint('Removing item ID: $id from favorites');
      }

      final response = await apiClient.deleteData(
        uri,
        attemptTokenRefresh: true
      );

      if (response != null) {
        debugPrint('Successfully removed from favorites');
        return true;
      }

      debugPrint('Failed to remove from favorites - null response');
      return false;
    } catch (e) {
      debugPrint('Error removing from favorite list: $e');
      return false;
    }
  }
}
