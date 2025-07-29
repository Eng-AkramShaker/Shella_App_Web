// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:http/http.dart';
import 'package:shella_design/features/favorite/domain/models/favorite_model.dart';
import 'package:shella_design/features/favorite/domain/reposotories/favorite_repository_interface.dart';
import 'package:shella_design/features/favorite/domain/services/favorite_service_interface.dart';

class FavoriteService implements Favorite_ServiceInterface {
  final FavoriteRepositoryInterface favoriteRepositoryinterface;
  FavoriteService({required this.favoriteRepositoryinterface});

  //

  @override
  Future<FavouriteModel> getFavourite() async {
    return await favoriteRepositoryinterface.getFavourite();
  }

  @override
  Future<Response> addFavourite({bool isStore = false, int? id}) async {
    return await favoriteRepositoryinterface.addFavourite(isStore: isStore, id: id);
  }

  @override
  Future<Response> deleteFavourite(int? id, {bool isStore = false}) async {
    return await favoriteRepositoryinterface.deleteFavourite(id, isStore: isStore);
  }
}
