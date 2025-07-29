// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:http/http.dart';
import 'package:shella_design/features/favorite/domain/models/favorite_model.dart';

abstract class Favorite_ServiceInterface {
  //

  Future<FavouriteModel> getFavourite();
  Future<Response> addFavourite({bool isStore = false, int? id});
  Future<Response> deleteFavourite(int? id, {bool isStore = false});
}
