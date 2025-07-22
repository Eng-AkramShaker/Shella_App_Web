import 'package:shella_design/features/settings/domain/models/customer_info_model.dart';

abstract class CustomerRepositoryInterface {
  Future<User_Model?> getUserInfo();

  Future<User_Model> updatedUserInfo(Map<String, dynamic> data);

  Future<bool> deleteAccount();
}
