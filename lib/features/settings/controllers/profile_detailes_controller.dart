import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/settings/domain/models/profile_detailes_model.dart';
import 'package:shella_design/features/settings/domain/services/profileDetailsServiceInterface/profile_details_service_interface.dart';

enum RequestState { initial, loading, success, error }

class ProfileController extends ChangeNotifier {
  final ProfileDetailsServiceInterface profileDetailsService;

  ProfileController({required this.profileDetailsService});

  RequestState adressstate = RequestState.initial;

  RequestState get adresstate => adressstate;

  List<Address>? address;
  List<Address>? get getedaddress => address;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  //add address page
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
  Future<void> getAdress() async {
    adressstate = RequestState.loading;
    notifyListeners();

    try {
      address = await profileDetailsService.getAddressList();
      adressstate = RequestState.success;
    } catch (e) {
      _errorMessage = "فشل في الاتصال";

      adressstate = RequestState.error;
    }
    notifyListeners();
  }

  /// Adds a new address
  Future<void> addAddress(Address newAddress) async {
    adressstate = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.addAddress(newAddress);
      if (success) {
        address?.add(newAddress);
        adressstate = RequestState.success;
        // getAdress();
      } else {
        throw Exception("فشل في إضافة العنوان");
      }
    } catch (e) {
      _errorMessage = "فشل في الاتصال";
      adressstate = RequestState.error;
    }
    notifyListeners();
  }

  /// Removes an address by ID
  Future<void> removeAddress(String addressId) async {
    adressstate = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.removeAddress(addressId);
      if (success) {
        address?.removeWhere((addr) => addr.id.toString() == addressId);
        adressstate = RequestState.success;
        await getAdress();
      } else {
        throw Exception("فشل في حذف العنوان");
      }
    } catch (e) {
      _errorMessage = "فشل في الاتصال";
      adressstate = RequestState.error;
    }

    notifyListeners();
  }

  /// Updates an existing address
  Future<void> updateAddress(Address updatedAddress) async {
    adressstate = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.updateAddress(updatedAddress);
      if (success) {
        int index = address?.indexWhere((a) => a.id == updatedAddress.id) ?? -1;
        if (index != -1) {
          address?[index] = updatedAddress;
        }
        adressstate = RequestState.success;
      } else {
        throw Exception("فشل في تعديل العنوان");
      }
    } catch (e) {
      _errorMessage = "فشل في الاتصال";
      adressstate = RequestState.error;
    }
    notifyListeners();
  }

  void updateTybe(int newTybe) {
    tybe = newTybe;
    notifyListeners();
  }

  void updatefloor(int newfloor) {
    floor = newfloor;
    notifyListeners();
  }

  void resetOperationState() {
    if (adressstate != RequestState.initial) {
      adressstate = RequestState.initial;
      _errorMessage = null;
      notifyListeners();
    }
  }

  /// Resets the controller state
  void resetState() {
    adressstate = RequestState.initial;
    address = null;
    _errorMessage = null;
    notifyListeners();
  }

  void resetAddState() {
    adressstate = RequestState.initial;
    _errorMessage = null;
    notifyListeners();
  }
}
