// ignore_for_file: file_names

import 'dart:convert';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import '../../../../api/api_client.dart';

abstract class ProfileRepository {
  Future<List<Address>> getAddressList();
  Future<bool> addAddress(Address address);
  Future<bool> removeAddress(String addressId);
  Future<bool> updateAddress(Address address);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiClient apiClient;

  ProfileRepositoryImpl({
    required this.apiClient,
  });

  @override
  Future<List<Address>> getAddressList() async {
    final response = await apiClient.getData(
      Uri.parse(Api_Constants.addresslist).toString(),
      forceRefreshToken: false,
    );

    if (response != null) {
      if (response.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
        print('===================');
        print(responsemap);
        List<Address> r = List<Address>.from(
          (responsemap['addresses'] ?? []).map(
            (e) => Address.fromJson(e),
          ),
        );
        return r;
      } else {
        throw Exception('Failed to fetch addresses');
      }
    } else {
      throw Exception('Failed to fetch addresses');
    }
  }

  @override
  Future<bool> addAddress(Address address) async {
    final response = await apiClient.postData(
      Uri.parse(Api_Constants.addAddressUri).toString(),
      address.toJson(),
    );
    var responsemap = jsonDecode(response!.body);
    print('===================');
    print(response.statusCode);
    print(responsemap);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to add address');
    }
  }

  @override
  Future<bool> removeAddress(String addressId) async {
    final response = await apiClient.deleteData(
      Uri.parse('${Api_Constants.removeAddressUri}/$addressId').toString(),
    );

    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to remove address');
    }
  }

  @override
  Future<bool> updateAddress(Address address) async {
    final response = await apiClient.putData(
      Uri.parse('${Api_Constants.updateAddressUri}/${address.id}').toString(),
      address.toJson(),
    );

    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update address');
    }
  }
}
