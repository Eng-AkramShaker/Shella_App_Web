import 'package:shella_design/features/Favorite/domain/models/item_model.dart';
import 'package:shella_design/features/Favorite/domain/models/store_model.dart';

class FavoriteModel {
  List<int> wishItemIdList = [];
  List<int> wishStoreIdList = [];
  List<Item> wishItemList = [];
  List<Store> wishStoreList = [];

  FavoriteModel({
    this.wishItemIdList = const [],
    this.wishStoreIdList = const [],
    this.wishItemList = const [],
    this.wishStoreList = const [],
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    // Parse item data with error handling
    try {
      if (json.containsKey('item')) {
        wishItemList = [];
        wishItemIdList = [];

        if (json['item'] != null && json['item'] is List) {
          for (var item in json['item']) {
            if (item is Map<String, dynamic>) {
              try {
                final itemObj = Item.fromJson(item);
                wishItemList.add(itemObj);

                if (item['id'] != null) {
                  wishItemIdList.add(item['id']);
                }
              } catch (e) {
                print('Error parsing individual item: $e');
              }
            }
          }
        }
        print('Parsed ${wishItemList.length} favorite items');
      } else {
        print('JSON does not contain "item" key');
      }
    } catch (e) {
      print('Error parsing item list: $e');
    }

    // Parse store data with error handling
    try {
      if (json.containsKey('store')) {
        wishStoreList = [];
        wishStoreIdList = [];

        if (json['store'] != null && json['store'] is List) {
          for (var store in json['store']) {
            if (store is Map<String, dynamic>) {
              try {
                final storeObj = Store.fromJson(store);
                wishStoreList.add(storeObj);

                if (store['id'] != null) {
                  wishStoreIdList.add(store['id']);
                }
              } catch (e) {
                print('Error parsing individual store: $e');
              }
            }
          }
        }
        print('Parsed ${wishStoreList.length} favorite stores');
      } else {
        print('JSON does not contain "store" key');
      }
    } catch (e) {
      print('Error parsing store list: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    // Only include if non-empty
    if (wishItemList.isNotEmpty) {
      data['item'] = wishItemList.map((item) => item.toJson()).toList();
    }

    if (wishStoreList.isNotEmpty) {
      data['store'] = wishStoreList.map((store) => store.toJson()).toList();
    }

    return data;
  }
}



