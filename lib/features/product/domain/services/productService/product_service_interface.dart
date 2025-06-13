import '../../models/store_details_model.dart';

abstract class ProductServiceInterface {

  Future<StoreDetailsModel> getStoreDetails({required String storeId});

}