import 'dart:convert';
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/settings/domain/models/customer_info_model.dart';
import 'package:shella_design/features/settings/domain/repositories/customer_info_reposittory_interface.dart';

class CustomerRepository implements CustomerRepositoryInterface {
  final ApiClient apiClient;

  CustomerRepository({required this.apiClient});

  @override
  Future<CustomerModel> getCustomerInfo() async {
    final uri = Uri.parse(ApiConstants.customerInfo);
    final response = await apiClient.getData(
      uri.toString(),
    );
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return CustomerModel.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load customer data');
    }
  }

  @override
  Future<CustomerModel> updateCustomerInfo(Map<String, dynamic> data) async {
    final uri = Uri.parse(ApiConstants.updateCustomerInfo);
    final response = await apiClient.postData(
      context,
      uri.toString(),
      data,
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      if (jsonBody.containsKey('customer')) {
        return CustomerModel.fromJson(jsonBody['customer']);
      } else if (jsonBody.containsKey('data')) {
        return CustomerModel.fromJson(jsonBody['data']);
      } else {
        // If the API returns only a message, we need to refetch the customer data
        return await getCustomerInfo();
      }
    } else {
      final errorBody = jsonDecode(response.body);
      final errors = errorBody['errors'] as List<dynamic>;
      final errorMessages = errors.map((e) => e['message']).join(', ');
      throw Exception('فشل في تحديث الملف الشخصي');
    }

    // return CustomerModel.fromJson(jsonBody);
  }

  @override
  Future<bool> deleteAccount() async {
    try {
      final uri = Uri.parse(ApiConstants.removeAccount);

      final response = await apiClient.deleteData(uri.toString());

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        print("فشل الحذف - رمز ${response.statusCode}");
        throw Exception('فشل في حذف الحساب - رمز ${response.statusCode}');
      }
    } catch (e) {
      print("حدث خطأ في $e");
      rethrow;
    }
  }
}
