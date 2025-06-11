import '../../models/discount_model.dart';

abstract class DiscountServiceInterface {

  Future<List<DiscountProduct>> fetchDiscountedProducts({offset});

}