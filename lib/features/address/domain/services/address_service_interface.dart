import '../models/address_model.dart';

abstract class AddressService {
  Future<List<Address>> fetchAddressList();
  Future<bool> addAddress(Address address);
  Future<bool> removeAddress(String addressId);
  Future<bool> updateAddress(Address address);
}
