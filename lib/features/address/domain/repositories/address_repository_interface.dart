import '../models/address_model.dart';

abstract class AddressRepository {
  Future<List<Address>> getAddressList();
  Future<bool> addAddress(Address address);
  Future<bool> removeAddress(String addressId);
  Future<bool> updateAddress(Address address);
}
