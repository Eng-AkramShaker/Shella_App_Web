// ignore_for_file: file_names, non_constant_identifier_names

import 'package:http/http.dart';
import 'package:shella_design/features/favorite/domain/models/favorite_model.dart';

abstract class FavoriteRepositoryInterface {
  //

  Future<FavouriteModel> getFavourite();
  Future<Response> addFavourite({bool isStore = false, int? id});
  Future<Response> deleteFavourite(int? id, {bool isStore = false});
}
