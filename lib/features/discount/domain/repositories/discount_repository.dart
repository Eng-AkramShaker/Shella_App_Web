import 'package:flutter/material.dart';
import 'package:shella_design/features/discount/domain/models/discount_model.dart';
import 'package:shella_design/features/discount/domain/services/discount_service.dart';

class DiscountRepository {
  final DiscountService service;

  DiscountRepository(this.service);

  Future<List<DiscountProduct>> fetchDiscountedProducts() async {
    try {
     // print('🟣 [Repository] Fetching products...'); // بدء جلب البيانات
      final data = await service.getDiscountedProducts();
      
      print('🟢 [Repository] Data received, count: ${data.length}'); // عدد المنتجات
      if (data.isNotEmpty) {
       // print('🔵 [First Product] ${data[0]}'); // طباعة أول منتج كمثال
      }

      return data.map<DiscountProduct>((json) {
        return DiscountProduct.fromJson(json);
      }).toList();
    } catch (e) {
     // print('🔴 [Repository Error] $e');
      rethrow;
    }
  }
}
