import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shella_design/features/product/domain/models/store_details_model.dart';
import 'package:shella_design/features/product/domain/repositories/productRepository/product_repository_interface.dart';
import 'package:shella_design/features/product/domain/services/productService/product_service_interface.dart';

class ProductService extends ProductServiceInterface {

  final ProductRepositoryInterface productRepositoryInterface;
  ProductService(this.productRepositoryInterface);

  ///-------------------------------------<<<---GET STORE DETAILS--->>>-------------------------------------
  @override
  Future<StoreDetailsModel> getStoreDetails({required String storeId}) async {
    try{
      Response? response = await productRepositoryInterface.getStoreDetails(storeId: storeId);
      if(response!.statusCode==200){
        return StoreDetailsModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Get Store Details Failed');
      }
    }catch(e){
      if (kDebugMode) {
        print('Get Store Details Exception :: ${e.toString()}');
      }
      throw Exception('Get Store Details Exception :: ${e.toString()}');
    }
  }

}
