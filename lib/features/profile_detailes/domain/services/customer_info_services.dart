import 'package:image_picker/image_picker.dart';
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

  Future<CustomerModel?> updateCustomerInfoWithImage(
    Map<String, dynamic> data, {
    required XFile imageFile,
  }) async {
    return await customerRepository.updateCustomerInfoWithImage(
      data,
      imageFile: imageFile,
    );
  }

  Future<bool> deleteAccount() async {
    return await customerRepository.deleteAccount();
  }
}
