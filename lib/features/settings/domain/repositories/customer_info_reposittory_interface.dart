import 'package:image_picker/image_picker.dart';
import 'package:shella_design/features/settings/domain/models/customer_info_model.dart';


abstract class CustomerRepositoryInterface {
  Future<CustomerModel?> getCustomerInfo();

  Future<CustomerModel> updateCustomerInfo(Map<String, dynamic> data);

  Future<bool> deleteAccount();

  Future<CustomerModel?> updateCustomerInfoWithImage(Map<String, dynamic> data,
      {required XFile imageFile});
}