// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shella_design/features/favorite/domain/models/favorite_model.dart';
import 'package:shella_design/features/favorite/domain/services/favorite_service_interface.dart';

class Favorite_Controller with ChangeNotifier {
  final Favorite_ServiceInterface favoriteServiceInterface;
  Favorite_Controller({required this.favoriteServiceInterface});
  //

  FavouriteModel List_favourite = FavouriteModel(item: [], store: []);

  // ==================================================================================

  Future getFavourite() async {
    List_favourite = await favoriteServiceInterface.getFavourite();
    notifyListeners();
  }
}
