import 'package:flutter/foundation.dart';
import 'package:shella_design/features/Favorite/domain/models/features_model.dart';
import 'package:shella_design/features/Favorite/domain/repositories/features_repository.dart';

class FavoriteService {
  final FavoriteRepository favoriteRepository;
  
  FavoriteService({required this.favoriteRepository});
  
  Future<FavoriteModel?> getFavoriteList() async {
    try {
      final result = await favoriteRepository.getFavoriteList();
      
      if (result != null) {
        if (kDebugMode) {
          debugPrint('Favorite service received data:');
          debugPrint('  - Items: ${result.wishItemList.length}');
          debugPrint('  - Stores: ${result.wishStoreList.length}');
        }
      } else {
        debugPrint('Favorite service received null result');
      }
      
      return result;
    } catch (e) {
      debugPrint('Error in FavoriteService.getFavoriteList: $e');
      return null;
    }
  }
  
  Future<bool> addToFavoriteList(int? itemId, int? storeId) async {
    try {
      return await favoriteRepository.addToFavoriteList(itemId, storeId);
    } catch (e) {
      debugPrint('Error in FavoriteService.addToFavoriteList: $e');
      return false;
    }
  }
  
  Future<bool> removeFromFavoriteList(int id, bool isStore) async {
    try {
      return await favoriteRepository.removeFromFavoriteList(id, isStore);
    } catch (e) {
      debugPrint('Error in FavoriteService.removeFromFavoriteList: $e');
      return false;
    }
  }
}