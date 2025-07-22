import 'package:http/http.dart' as http;
import '../../models/profile_detailes_model.dart';

abstract class ProfileDetailsRepositoryInterface {

  Future<http.Response?> getAddressList(); // List<Address>
  Future<http.Response?> addAddress(Address address);
  Future<http.Response?> removeAddress(String addressId);
  Future<http.Response?> updateAddress(Address address);

}