import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shella_design/features/discount/domain/models/discount_model.dart';
import 'package:shella_design/features/discount/domain/repositories/discountRepositoryInterface/discount_repository_interface.dart';
import 'package:shella_design/features/discount/domain/services/discountServiceInterface/discount_service_interface.dart';

class DiscountService implements DiscountServiceInterface{

  final DiscountRepositoryInterface discountRepositoryInterface;
  DiscountService({required this.discountRepositoryInterface});

  @override
  Future<List<DiscountProduct>> fetchDiscountedProducts({offset}) async {
    try{
      Response? response = await discountRepositoryInterface.fetchDiscountedProducts(offset: offset);
      if(response!.statusCode==200){
        if (kDebugMode) {
          print('Fetch Discount Products Response :: ${response.body}');
        }
        return (jsonDecode(response.body)['products']).map<DiscountProduct>((json) {return DiscountProduct.fromJson(json);}).toList();
      }else{
        throw Exception('Fetch Discount Products Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Fetch Discount Products Exception :: ${e.toString()}');
      }
      throw Exception('Fetch Discount Products Exception :: ${e.toString()}');
    }
  }
}