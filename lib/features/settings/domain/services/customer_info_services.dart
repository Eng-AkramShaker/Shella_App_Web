import 'package:image_picker/image_picker.dart';
import 'package:shella_design/features/settings/domain/models/customer_info_model.dart';
import 'package:shella_design/features/settings/domain/repositories/customer_info_reposittory_interface.dart';

class CustomerService {
  final CustomerRepositoryInterface customerRepository;

  CustomerService({required this.customerRepository});

  Future<User_Model?> getCustomerInfo() async {
    return await customerRepository.getCustomerInfo();
  }

  Future<User_Model?> updateCustomerInfo(Map<String, dynamic> data) async {
    return await customerRepository.updateCustomerInfo(data);
  }

  Future<User_Model?> updateCustomerInfoWithImage(
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
