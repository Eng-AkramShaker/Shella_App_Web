import 'package:shella_design/features/profile_detailes/domain/models/customer_info_model.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/customer_info_reposittory_interface.dart';

class CustomerService {
  final CustomerRepositoryInterface customerRepository;

  CustomerService({required this.customerRepository});

  Future<CustomerModel?> getCustomerInfo() async {
    return await customerRepository.getCustomerInfo();
  }

  Future<CustomerModel?> updateCustomerInfo(Map<String, dynamic> data) async {
    return await customerRepository.updateCustomerInfo(data);
  }

  Future<bool> deleteAccount() async {
    return await customerRepository.deleteAccount();
  }
}
