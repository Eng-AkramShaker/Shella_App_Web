import '../../models/profile_detailes_model.dart';

abstract class ProfileDetailsServiceInterface {

  Future<List<Address>> getAddressList();
  Future<bool> addAddress(Address address);
  Future<bool> removeAddress(String addressId);
  Future<bool> updateAddress(Address address);

}