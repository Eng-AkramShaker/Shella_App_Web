import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/print/custom_print.dart';
import '../domain/models/store_details_model.dart';
import '../domain/services/productService/product_service_interface.dart';

class ProductController extends ChangeNotifier {

  final ProductServiceInterface productServiceInterface;
  ProductController(this.productServiceInterface);

  static ProductController get(context,{listen = true}) => Provider.of<ProductController>(context,listen: listen);

  ///-------------------------------------<<<---APIs--->>>-------------------------------------

  /// GET STORE DETAILS
  StoreDetailsModel? storeDetailsModel;
  getStoreDetails({storeId}) async {
    try{
      storeDetailsModel=null;
      notifyListeners();
      storeDetailsModel = await productServiceInterface.getStoreDetails(storeId: storeId);
      notifyListeners();
    }catch(e){
      notifyListeners();
    }
  }

}