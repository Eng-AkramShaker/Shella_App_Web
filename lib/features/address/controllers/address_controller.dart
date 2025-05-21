import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shella_design/features/address/domain/models/address_model.dart';
import 'package:shella_design/features/address/domain/services/address_service_interface.dart';

enum RequestState { initial, loading, success, error }

class AddressController extends ChangeNotifier {
  final AddressService addressService;

  AddressController({required this.addressService}) {
    // Set default selected address ID to 1
    _selectedAddressId = 1;
  }

  RequestState _addressState = RequestState.initial;
  RequestState get addressState => _addressState;

  List<Address>? _addresses;
  List<Address>? get addresses => _addresses;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // For address type selection and floor selection
  int addressType = 1;
  int floor = 1;

  // Flag to track if an address was actually submitted
  bool _wasAddressActuallySubmitted = false;
  bool get wasAddressActuallySubmitted => _wasAddressActuallySubmitted;

  // Selected address ID
  int? _selectedAddressId = 1; // Default to ID 1
  int? get selectedAddressId => _selectedAddressId;

  /// Fetches the list of addresses
  Future<void> getAddresses() async {
    _addressState = RequestState.loading;
    notifyListeners();

    try {
      _addresses = await addressService.fetchAddressList();
      _addressState = RequestState.success;

      // If no address is selected, set ID 1 as default
      _selectedAddressId ??= 1;
    } catch (e) {
      _errorMessage = e.toString();
      _addressState = RequestState.error;
    }
    notifyListeners();
  }

  /// Set selected address ID
  void setSelectedAddress(int id) {
    _selectedAddressId = id;
    notifyListeners();
  }

  /// Check if an address is selected
  bool isAddressSelected(int id) {
    return _selectedAddressId == id;
  }

  /// Adds a new address
  Future<void> addAddress(Address newAddress) async {
    _addressState = RequestState.loading;
    _wasAddressActuallySubmitted = true;
    notifyListeners();

    try {
      bool success = await addressService.addAddress(newAddress);
      if (success) {
        _addresses?.add(newAddress);
        _addressState = RequestState.success;
        getAddresses(); // Refresh the list
      } else {
        throw Exception("Failed to add address");
      }
    } catch (e) {
      _errorMessage = e.toString();
      _addressState = RequestState.error;
    }
    notifyListeners();
  }

  /// Removes an address by ID
  Future<void> removeAddress(String addressId) async {
    _addressState = RequestState.loading;
    notifyListeners();

    try {
      bool success = await addressService.removeAddress(addressId);
      if (success) {
        _addresses?.removeWhere((addr) => addr.id.toString() == addressId);

        // If the removed address was selected, set default to ID 1
        if (_selectedAddressId.toString() == addressId) {
          _selectedAddressId = 1;
        }

        _addressState = RequestState.success;
      } else {
        throw Exception("Failed to remove address");
      }
    } catch (e) {
      _errorMessage = e.toString();
      _addressState = RequestState.error;
    }
    notifyListeners();
  }

  /// Updates an existing address
  Future<void> updateAddress(Address updatedAddress) async {
    _addressState = RequestState.loading;
    _wasAddressActuallySubmitted = true;
    notifyListeners();

    try {
      bool success = await addressService.updateAddress(updatedAddress);
      if (success) {
        int index =
            _addresses?.indexWhere((addr) => addr.id == updatedAddress.id) ??
                -1;
        if (index != -1) {
          _addresses?[index] = updatedAddress;
        }
        _addressState = RequestState.success;
        await getAddresses(); // تحديث القائمة بعد تحديث العنوان
      } else {
        throw Exception("Failed to update address");
      }
    } catch (e) {
      _errorMessage = e.toString();
      _addressState = RequestState.error;
    }
    notifyListeners();
  }

  void updateAddressType(int newType) {
    addressType = newType;
    notifyListeners();
  }

  void updateFloor(int newFloor) {
    floor = newFloor;
    notifyListeners();
  }

  /// Resets the controller state
  void resetState() {
    _addressState = RequestState.initial;
    _addresses = [];
    _errorMessage = null;
    _selectedAddressId = 1; // Reset to default ID 1
    notifyListeners();
  }

  /// إعادة تعيين حالة العنوان فقط بدون تغيير البيانات
  void resetAddressState() {
    _addressState = RequestState.initial;
    _errorMessage = null;
    _wasAddressActuallySubmitted = false; // Reset the submission flag
    notifyListeners();
  }
}
