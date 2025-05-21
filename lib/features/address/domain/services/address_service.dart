import 'package:shella_design/features/address/domain/models/address_model.dart';
import 'package:shella_design/features/address/domain/repositories/address_repository_interface.dart';
import 'package:shella_design/features/address/domain/services/address_service_interface.dart';

class AddressServiceImpl implements AddressService {
  final AddressRepository addressRepository;

  AddressServiceImpl({required this.addressRepository});

  @override
  Future<List<Address>> fetchAddressList() async {
    return await addressRepository.getAddressList();
  }

  @override
  Future<bool> addAddress(Address address) async {
    return await addressRepository.addAddress(address);
  }

  @override
  Future<bool> removeAddress(String addressId) async {
    return await addressRepository.removeAddress(addressId);
  }

  @override
  Future<bool> updateAddress(Address address) async {
    return await addressRepository.updateAddress(address);
  }
}
