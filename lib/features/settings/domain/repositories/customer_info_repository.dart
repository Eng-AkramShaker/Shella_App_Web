// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
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
      uri.toString(),
      data,
    );
    if (response?.statusCode == 200) {
      final jsonBody = jsonDecode(response!.body);
      if (jsonBody.containsKey('customer')) {
        return CustomerModel.fromJson(jsonBody['customer']);
      } else if (jsonBody.containsKey('data')) {
        return CustomerModel.fromJson(jsonBody['data']);
      } else {
        return await getCustomerInfo();
      }
    } else {
      final errorBody = jsonDecode(response!.body);
      final errors = errorBody['errors'] as List<dynamic>;
      final errorMessage = errorBody['message'] ?? 'فشل في تحديث الملف الشخصي';
      throw Exception(errorMessage);
    }
  }

  @override
  Future<CustomerModel> updateCustomerInfoWithImage(
      Map<String, dynamic> data, {
        required XFile imageFile,
      }) async {
    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    data['image'] = base64Image;
    final uri = Uri.parse(ApiConstants.updateCustomerInfo);

    Map<String, String> stringData = {};
    data.forEach((key, value) {
      stringData[key] = value.toString();
    });
    List<MultipartBody> multipartBody = [MultipartBody('image', imageFile)];
    final response = await apiClient.postMultipartData(
      uri.toString(),
      stringData,
      multipartBody,
    );
    return _handleUpdateResponse(response);
  }

  Future<CustomerModel> _handleUpdateResponse(dynamic response) async {
    try {
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final jsonBody = jsonDecode(response.body);
          if (jsonBody.containsKey('customer')) {
            return CustomerModel.fromJson(jsonBody['customer']);
          } else if (jsonBody.containsKey('data')) {
            return CustomerModel.fromJson(jsonBody['data']);
          } else {
            return await getCustomerInfo();
          }
        } else {
          final errorBody = jsonDecode(response.body);
          final errorMessage =
              errorBody['message'] ?? 'فشل في تحديث الملف الشخصي';
          throw Exception(errorMessage);
        }
      } else {
        throw Exception('Invalid response type');
      }
    } catch (e) {
      print('❌خطأ في معالجة الرد: ${e.toString()}');
      throw Exception('فشل في معالجة استجابة الخادم');
    }
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