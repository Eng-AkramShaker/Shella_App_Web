import 'package:shella_design/features/settings/domain/models/customer_info_model.dart';
import 'package:shella_design/features/settings/domain/repositories/customer_info_reposittory_interface.dart';

class CustomerService {
  final CustomerRepositoryInterface customerRepository;

  CustomerService({required this.customerRepository});

  Future<User_Model?> getUserInfo() async {
    return await customerRepository.getUserInfo();
  }

  Future<User_Model?> updatedUserInfo(Map<String, dynamic> data) async {
    return await customerRepository.updatedUserInfo(data);
  }

  Future<bool> deleteAccount() async {
    return await customerRepository.deleteAccount();
  }
}
