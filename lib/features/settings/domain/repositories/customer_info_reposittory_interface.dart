import 'package:image_picker/image_picker.dart';
import 'package:shella_design/features/settings/domain/models/customer_info_model.dart';

abstract class CustomerRepositoryInterface {
  Future<User_Model?> getCustomerInfo();

  Future<User_Model> updateCustomerInfo(Map<String, dynamic> data);

  Future<bool> deleteAccount();

  Future<User_Model?> updateCustomerInfoWithImage(Map<String, dynamic> data, {required XFile imageFile});
}
