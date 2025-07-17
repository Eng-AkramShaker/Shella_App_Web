import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/features/profile_detailes/domain/services/profileDetailsServiceInterface/profile_details_service_interface.dart';
import 'package:shella_design/features/profile_detailes/screens/mobile/address_screens/addNewAdress.dart';

import 'map_controller.dart';

enum RequestState { initial, loading, success, error }

class ProfileController extends ChangeNotifier {
  final ProfileDetailsServiceInterface profileDetailsService;

  ProfileController({required this.profileDetailsService});

  RequestState addressState = RequestState.initial;

  RequestState get getAddressState => addressState;

  List<Address>? address;

  List<Address>? get getAddresses => address;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  int tybe = 1;
  int floor = 1;

  /// WEP
  int _currentPage = 0;
  int _currentAddressesPage = 0;

  // Getters
  int get currentPage => _currentPage;

  int get currentAddressesPage => _currentAddressesPage;

  // Setters
  void setCurrentAddressesPage(int value) {
    _currentAddressesPage = value;
    notifyListeners();
  }

  void changePage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void changeAddressesPage() => notifyListeners();

  /// Fetches the list of addresses
  Future<void> getAddress() async {
    addressState = RequestState.loading;
    notifyListeners();

    try {
      address = await profileDetailsService.getAddressList();
      addressState = RequestState.success;
    } catch (e) {
      _errorMessage = "فشل في الاتصال";

      addressState = RequestState.error;
    }
    notifyListeners();
  }

  /// Adds a new address
  Future<void> addAddress(Address newAddress) async {
    addressState = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.addAddress(newAddress);
      if (success) {
        address?.add(newAddress);
        addressState = RequestState.success;
      } else {
        throw Exception("فشل في إضافة العنوان");
      }
    } catch (e) {
      _errorMessage = "فشل في الاتصال";
      addressState = RequestState.error;
    }
    notifyListeners();
  }

  /// Removes an address by ID
  Future<void> removeAddress(String addressId) async {
    addressState = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.removeAddress(addressId);
      if (success) {
        address?.removeWhere((addr) => addr.id.toString() == addressId);
        addressState = RequestState.success;
        await getAddress();
      } else {
        throw Exception("فشل في حذف العنوان");
      }
    } catch (e) {
      _errorMessage = "فشل في الاتصال";
      addressState = RequestState.error;
    }

    notifyListeners();
  }

  /// Updates an existing address
  Future<void> updateAddress(Address updatedAddress) async {
    addressState = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.updateAddress(updatedAddress);
      if (success) {
        int index = address?.indexWhere((a) => a.id == updatedAddress.id) ?? -1;
        if (index != -1) {
          address?[index] = updatedAddress;
        }
        addressState = RequestState.success;
      } else {
        throw Exception("فشل في تعديل العنوان");
      }
    } catch (e) {
      _errorMessage = "فشل في الاتصال";
      addressState = RequestState.error;
    }
    notifyListeners();
  }

  void updateTybe(int newTybe) {
    tybe = newTybe;
    notifyListeners();
  }

  void updateFloor(int newfloor) {
    floor = newfloor;
    notifyListeners();
  }

  /// Rest State
  void resetOperationState() {
    if (addressState != RequestState.initial) {
      addressState = RequestState.initial;
      _errorMessage = null;
      notifyListeners();
    }
  }

  /// Resets the controller state
  void resetState() {
    addressState = RequestState.initial;
    address = null;
    _errorMessage = null;
    notifyListeners();
  }

  /// Reset the controller state
  void resetAddState() {
    addressState = RequestState.initial;
    _errorMessage = null;
    notifyListeners();
  }

  /// Navigate TO Edit Address Screen
  void navigateToEditScreen(BuildContext context, Address address) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewAddressScreen(editAddress: address),
      ),
    ).then((result) {
      if (result == true) {
        context.read<ProfileController>().getAddress();
      }
    });
  }

  /// Navigate TO Add New Address Screen
  void navigateToAddScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewAddressScreen()),
    ).then((result) {
      if (result == true) {
        context.read<ProfileController>().getAddress();
      }
    });
  }

  /// Validate Text Fields In Add Address
  bool validateInputs({
    required String name,
    required String phone,
    required String address,
    required LatLng? location,
  }) {
    return name.isNotEmpty &&
        phone.isNotEmpty &&
        address.isNotEmpty &&
        location != null;
  }

  /// Get Address Type
  String getAddressType(int tybe) {
    switch (tybe) {
      case 1:
        return 'منزل';
      case 2:
        return 'عمل';
      case 3:
        return 'أخرى';
      default:
        return 'منزل';
    }
  }

  ///Initialize Text Fields In Edit Address
  void initializeEditForm(
      Address address,
      MapController mapController,
      TextEditingController nameController,
      TextEditingController phoneController,
      TextEditingController addressController,
      TextEditingController streetController,
      void Function(int) updateTybe,
      void Function(int) updateFloor) {
    nameController.text = address.contactPersonName;
    phoneController.text = address.contactPersonNumber;
    addressController.text = address.address;
    streetController.text = address.road ?? '';

    final lat = double.tryParse(address.latitude);
    final lng = double.tryParse(address.longitude);
    if (lat != null && lng != null) {
      mapController.setSelectedLocation(LatLng(lat, lng));
    }

    if (address.addressType == 'عمل') {
      updateTybe(2);
    } else if (address.addressType == 'أخرى' ||
        address.addressType == 'إضافة') {
      updateTybe(3);
    } else {
      updateTybe(1);
    }

    updateFloor(address.floor == 'أرضية' ? 2 : 1);
  }

  /// Submit Address Button
  void submitAddress(
    BuildContext context,
    Address? address,
    MapController mapController,
    bool isEditing,
    TextEditingController nameController,
    TextEditingController phoneController,
    TextEditingController addressController,
    TextEditingController streetController,
  ) {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى ملء جميع الحقول المطلوبة')),
      );
      return;
    }
    if (mapController.selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى تحديد الموقع على الخريطة')),
      );
      return;
    }
    final addressType = tybe == 1
        ? 'منزل'
        : tybe == 2
            ? 'عمل'
            : 'أخرى';

    final newAddress = Address(
      id: isEditing ? address?.id ?? 0 : 0,
      addressType: addressType,
      contactPersonName: nameController.text,
      contactPersonNumber: phoneController.text,
      address: addressController.text,
      latitude: mapController.selectedLocation!.latitude.toString(),
      longitude: mapController.selectedLocation!.longitude.toString(),
      userId: isEditing ? address?.userId ?? 0 : 0,
      createdAt: address?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
      zoneId: 1,
      zoneIds: [],
      floor: floor == 1 ? 'منزل' : 'أرضية',
      road: streetController.text,
    );

    if (isEditing) {
      updateAddress(newAddress);
    } else {
      addAddress(newAddress);
    }
  }
}
