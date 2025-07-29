// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:shella_design/features/favorite/domain/reposotories/favorite_repository_interface.dart';
import 'package:shella_design/features/favorite/domain/services/favorite_service_interface.dart';

class FavoriteService implements Favorite_ServiceInterface {
  final FavoriteRepositoryInterface favoriteRepositoryinterface;
  FavoriteService({required this.favoriteRepositoryinterface});
}
