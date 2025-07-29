// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, use_build_context_synchronously, depend_on_referenced_packages, annotate_overrides, unused_local_variable, empty_catches, override_on_non_overriding_member, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/models/response_model.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/favorite/domain/models/favorite_model.dart';
import 'package:shella_design/features/favorite/domain/reposotories/favorite_repository_interface.dart';

class FavoriteRepository implements FavoriteRepositoryInterface {
  final ApiClient apiClient;
  FavoriteRepository({required this.apiClient});

  @override
  Future<FavouriteModel> getFavourite() async {
    // 1. تحقق من وجود التوكن
    if (apiClient.token == null || apiClient.token!.isEmpty) {
      print("⚠️ لا يوجد توكن. لن يتم تنفيذ طلب المفضلة.");
      return FavouriteModel(item: [], store: []);
    }

    // 2. تهيئة نموذج افتراضي فارغ
    FavouriteModel listFavourite = FavouriteModel(item: [], store: []);

    // 3. تنفيذ الطلب
    final response = await apiClient.getData(ApiConstants.wishListGetUri);

    // 4. التحقق من نجاح الطلب
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      listFavourite = FavouriteModel.fromJson(data);
      print("✅ تم تحميل بيانات المفضلة بنجاح");
    } else {
      print("❌  ${response.statusCode}");
    }

    return listFavourite;
  }

  @override
  Future<Response> addFavourite({bool isStore = false, int? id}) async {
    try {
      final response = await apiClient.postData(
        '${ApiConstants.addWishListUri}${isStore ? 'store_id=' : 'item_id='}$id',
        null,
        handleError: false,
      );

      print("✅ تم إرسال الطلب لإضافة للمفضلة: ${response!.statusCode}");
      return response;
    } catch (e) {
      print("❌ خطأ في addFavourite: $e");
      return http.Response('حدث خطأ أثناء إضافة المفضلة', 500);
    }
  }

  @override
  Future<Response> deleteFavourite(int? id, {bool isStore = false}) async {
    try {
      final response = await apiClient.deleteData(
        '${ApiConstants.removeWishListUri}${isStore ? 'store_id=' : 'item_id='}$id',
        handleError: false,
      );

      print("🗑️ تم إرسال الطلب لحذف من المفضلة: ${response.statusCode}");
      return response;
    } catch (e) {
      print("❌ خطأ في deleteFavourite: $e");
      return http.Response('حدث خطأ أثناء حذف المفضلة', 500);
    }
  }
}
