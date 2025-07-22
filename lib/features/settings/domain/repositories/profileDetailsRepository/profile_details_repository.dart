import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/settings/domain/models/profile_detailes_model.dart';
import 'package:shella_design/features/settings/domain/repositories/profileDetailsRepositoryInterface/profile_details_repository_interface.dart';
import '../../../../../api/api_client.dart';
import '../../../../../common/helper/check_Logged.dart';
import '../../../../../common/util/sharedPre_constants.dart';

class ProfileRepository implements ProfileDetailsRepositoryInterface {
  @override
  Future<http.Response?> getAddressList() async {
    Response? response = await ApiClient(sharedPreferences: sp<SharedPreferences>()).getData(ApiConstants.addresslist);
    return response;
  }

  @override
  Future<http.Response?> addAddress(Address address) async {
    Response? response =
        await ApiClient(sharedPreferences: sp<SharedPreferences>()).postData(ApiConstants.addAddressUri, address.toJson());
    return response;
  }

  @override
  Future<http.Response?> removeAddress(String addressId) async {
    final params = {'address_id': addressId};

    final url = Uri.parse(ApiConstants.removeAddressUri).replace(queryParameters: {'address_id': addressId}).toString();

    return await ApiClient(sharedPreferences: sp<SharedPreferences>()).deleteData(url);
  }

  @override
  Future<http.Response?> updateAddress(Address address) async {
    Response? response = await ApiClient(sharedPreferences: sp<SharedPreferences>()).putData(
      '${ApiConstants.updateAddressUri}/${address.id}',
      address.toJson(),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${sp<SharedPreferences>().getString(SharedPrefKeys.userToken)}',
      },
      // jsonEncode(
      //   address.toJson(),
      // ),
    );
    return response;
  }
}
