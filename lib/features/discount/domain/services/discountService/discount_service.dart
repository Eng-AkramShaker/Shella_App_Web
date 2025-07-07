import 'package:shella_design/features/discount/domain/models/discount_model.dart';
import 'package:shella_design/features/discount/domain/repositories/discountRepositoryInterface/discount_repository_interface.dart';
import 'package:shella_design/features/discount/domain/services/discountServiceInterface/discount_service_interface.dart';

class DiscountService implements DiscountServiceInterface {
  final DiscountRepositoryInterface discountRepositoryInterface;

  DiscountService({required this.discountRepositoryInterface});

  @override
  Future<List<DiscountProduct>> fetchDiscountedProducts() async {
    try {
      // جلب البيانات من الريبو
      final data = await discountRepositoryInterface.fetchDiscountedProducts();

      return (data as List).map<DiscountProduct>((json) {
        return DiscountProduct.fromJson(json);
      }).toList();
    } catch (e) {
      print('🔴 [DiscountService] خطأ أثناء جلب البيانات: $e');
      rethrow;
    }
  }
}
