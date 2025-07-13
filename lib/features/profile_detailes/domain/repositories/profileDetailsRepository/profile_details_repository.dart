import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/profileDetailsRepositoryInterface/profile_details_repository_interface.dart';
import '../../../../../api/api_client.dart';
import '../../../../../common/helper/check_Logged.dart';

class ProfileRepository implements ProfileDetailsRepositoryInterface {
  @override
  Future<http.Response?> getAddressList() async {
    Response? response = await ApiClient(
            appBaseUrl: Api_Constants.appBaseUrl,
            sharedPreferences: sp<SharedPreferences>())
        .getData(Api_Constants.addresslist);
    return response;
  }

  @override
  Future<http.Response?> addAddress(Address address) async {
    Response? response = await ApiClient(
            appBaseUrl: Api_Constants.appBaseUrl,
            sharedPreferences: sp<SharedPreferences>())
        .postData(Api_Constants.addAddressUri, address.toJson());
    return response;
  }

  @override
  Future<http.Response?> removeAddress(String addressId) async {
    final params = {'address_id': addressId};
    final url =
        Uri.https('shalafood.net', '/api/v1/customer/address/delete', params);
    return await ApiClient(
            appBaseUrl: '', // Leave empty since we're building full URL
            sharedPreferences: sp<SharedPreferences>())
        .deleteData(url.toString());
    // final uri =
    //     Uri.parse(Api_Constants.appBaseUrl + Api_Constants.removeAddressUri)
    //         .replace(queryParameters: {'address_id': addressId}).toString();
    // Response? response = await ApiClient(
    //         appBaseUrl: Api_Constants.appBaseUrl,
    //         sharedPreferences: sp<SharedPreferences>())
    //     .deleteData(uri);
    // return response;
  }

  @override
  Future<http.Response?> updateAddress(Address address) async {
    Response? response = await ApiClient(
            appBaseUrl: Api_Constants.appBaseUrl,
            sharedPreferences: sp<SharedPreferences>())
        .putData(
      '${Api_Constants.updateAddressUri}/${address.id}',
      jsonEncode(
        address.toJson(),
      ),
    );
    return response;
  }
}
