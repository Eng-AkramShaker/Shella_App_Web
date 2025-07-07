import 'package:shella_design/features/profile_detailes/domain/models/customer_info_model.dart';

abstract class CustomerRepositoryInterface {
  Future<CustomerModel?> getCustomerInfo();
}