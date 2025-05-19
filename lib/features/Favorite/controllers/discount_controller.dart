import 'package:flutter/foundation.dart';
import 'package:shella_design/features/Favorite/domain/models/features_model.dart';
import 'package:shella_design/features/Favorite/domain/models/item_model.dart';
import 'package:shella_design/features/Favorite/domain/services/features_service.dart';

class FavoriteController extends ChangeNotifier {
  final FavoriteService favoriteService;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  FavoriteModel _favoriteModel = FavoriteModel();
  FavoriteModel get favoriteModel => _favoriteModel;
  
  // Error tracking
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  
  FavoriteController({required this.favoriteService});
  
  void updateService(FavoriteService newService) {
    // Method required for ChangeNotifierProxyProvider
  }
  
  Future<void> getFavoriteList() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      final result = await favoriteService.getFavoriteList();
      if (result != null) {
        _favoriteModel = result;
        debugPrint('Loaded favorite items: ${_favoriteModel.wishItemList.length}');
        debugPrint('Loaded favorite stores: ${_favoriteModel.wishStoreList.length}');
      } else {
        _errorMessage = 'فشل في تحميل المفضلة، يرجى التأكد من تسجيل الدخول أو إعادة تسجيل الدخول';
        debugPrint('Failed to load favorites - null response');
      }
    } catch (e) {
      debugPrint('Error getting favorite list in controller: $e');
      _errorMessage = 'خطأ: $e';
    }
    
    _isLoading = false;
    notifyListeners();
  }
  
  Future<void> addToFavoriteList(Item? item, int? storeId, bool isStore) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final int? id = isStore ? storeId : item?.id;
      if (id != null) {
        final result = await favoriteService.addToFavoriteList(isStore ? null : id, isStore ? id : null);
        
        if (result) {
          if (isStore) {
            _favoriteModel.wishStoreIdList.add(id);
          } else {
            _favoriteModel.wishItemIdList.add(id);
            if (item != null) {
              _favoriteModel.wishItemList.add(item);
            }
          }
          debugPrint('Successfully added to favorites: ${isStore ? 'store' : 'item'} id $id');
        } else {
          debugPrint('Failed to add to favorites: ${isStore ? 'store' : 'item'} id $id');
          _errorMessage = 'فشل في إضافة العنصر للمفضلة، يرجى التأكد من تسجيل الدخول';
        }
      }
    } catch (e) {
      debugPrint('Error adding to favorite list in controller: $e');
      _errorMessage = 'خطأ في إضافة العنصر للمفضلة: $e';
    }
    
    _isLoading = false;
    notifyListeners();
  }
  
  Future<void> removeFromFavoriteList(int id, bool isStore) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final result = await favoriteService.removeFromFavoriteList(id, isStore);
      
      if (result) {
        if (isStore) {
          _favoriteModel.wishStoreIdList.remove(id);
          _favoriteModel.wishStoreList.removeWhere((store) => store.id == id);
          debugPrint('Removed store id $id from favorites');
        } else {
          _favoriteModel.wishItemIdList.remove(id);
          _favoriteModel.wishItemList.removeWhere((item) => item.id == id);
          debugPrint('Removed item id $id from favorites');
        }
      } else {
        debugPrint('Failed to remove from favorites: ${isStore ? 'store' : 'item'} id $id');
        _errorMessage = 'فشل في إزالة العنصر من المفضلة، يرجى التأكد من تسجيل الدخول';
      }
    } catch (e) {
      debugPrint('Error removing from favorite list in controller: $e');
      _errorMessage = 'خطأ في إزالة العنصر من المفضلة: $e';
    }
    
    _isLoading = false;
    notifyListeners();
  }
  
  // إضافة دالة لمسح رسالة الخطأ
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
