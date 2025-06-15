
import 'package:shella_design/features/product/domain/models/store_details_model.dart';
import 'package:shella_design/features/product/domain/services/store_details_service.dart';

class StoreRepository {
  final StoreDetailsService _service;

  const StoreRepository({StoreDetailsService? service})
      : _service = service ?? const StoreDetailsService();

  Future<StoreDetailsModel> getStoreDetails(int storeId) {
    return _service.fetchStoreDetails(storeId);
  }

  Future<List<ProductModel>> getProducts({
    required int storeId,
    required int categoryId,
    required int offset,
    required int limit,
  }) {
    return _service.fetchProducts(
      storeId: storeId,
      categoryId: categoryId,
      offset: offset,
      limit: limit,
    );
  }
}
