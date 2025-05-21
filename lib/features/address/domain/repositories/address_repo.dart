import 'dart:convert';
import 'package:shella_design/features/address/domain/models/address_model.dart';
import 'package:shella_design/features/address/domain/repositories/address_repository_interface.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import '../../../../api/api_client.dart';

class AddressRepositoryImpl implements AddressRepository {
  final ApiClient apiClient;

  AddressRepositoryImpl({
    required this.apiClient,
  });

  @override
  Future<List<Address>> getAddressList() async {
    final response = await apiClient.getData(
      Uri.parse(Api_Constants.addresslist).toString(),
    );

    if (response != null) {
      if (response.statusCode == 200) {
        var responsemap = jsonDecode(response.body);
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
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to add address');
    }
  }

  @override
  Future<bool> removeAddress(String addressId) async {
    final response = await apiClient.deleteData(
      Uri.parse('${Api_Constants.removeAddressUri}$addressId').toString(),
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
      Uri.parse('${Api_Constants.updateAddressUri}${address.id}').toString(),
      address.toJson(),
    );

    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update address');
    }
  }
}
