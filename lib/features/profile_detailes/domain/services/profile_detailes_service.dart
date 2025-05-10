import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/features/profile_detailes/domain/repositories/profile_detailes_repository.dart';

class ProfileDetailsService {
  final ProfileRepository profileRepository;

  ProfileDetailsService({required this.profileRepository});

  Future<List<Address>> fetchAddressList() async {
    return await profileRepository.getAddressList();
  }

  Future<bool> addAddress(Address address) async {
    return await profileRepository.addAddress(address);
  }

  Future<bool> removeAddress(String addressId) async {
    return await profileRepository.removeAddress(addressId);
  }

  Future<bool> updateAddress(Address address) async {
    return await profileRepository.updateAddress(address);
  }
}
