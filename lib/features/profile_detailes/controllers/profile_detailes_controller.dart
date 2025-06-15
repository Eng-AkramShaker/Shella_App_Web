import 'package:flutter/material.dart';
import 'package:shella_design/features/profile_detailes/domain/models/profile_detailes_model.dart';
import 'package:shella_design/features/profile_detailes/domain/services/profileDetailsServiceInterface/profile_details_service_interface.dart';

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
  int tybe = 1;
  int floor = 1;

<<<<<<< HEAD
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
=======
>>>>>>> cbf245c5eb9111054d49dcebfa146b6a1ee73b83
  Future<void> getAdress() async {
    adressstate = RequestState.loading;
    notifyListeners();

    try {
      address = await profileDetailsService.getAddressList();
      adressstate = RequestState.success;
    } catch (e) {
      _errorMessage = e.toString();
      adressstate = RequestState.error;
    }
    notifyListeners();
  }

  Future<void> addAddress(Address newAddress) async {
    adressstate = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.addAddress(newAddress);
      if (success) {
        address?.add(newAddress);
        adressstate = RequestState.success;
        getAdress();
      } else {
        throw Exception("Failed to add address");
      }
    } catch (e) {
      _errorMessage = e.toString();
      adressstate = RequestState.error;
    }
    notifyListeners();
  }

  Future<void> removeAddress(String addressId) async {
    adressstate = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.removeAddress(addressId);
      if (success) {
        address?.removeWhere((addr) => addr.id == addressId);
        adressstate = RequestState.success;
      } else {
        throw Exception("Failed to remove address");
      }
    } catch (e) {
      _errorMessage = e.toString();
      adressstate = RequestState.error;
    }
    notifyListeners();
  }

  Future<void> updateAddress(Address updatedAddress) async {
    adressstate = RequestState.loading;
    notifyListeners();

    try {
      bool success = await profileDetailsService.updateAddress(updatedAddress);
      if (success) {
        int index =
            address?.indexWhere((addr) => addr.id == updatedAddress.id) ?? -1;
        if (index != -1) {
          address?[index] = updatedAddress;
        }
        adressstate = RequestState.success;
      } else {
        throw Exception("Failed to update address");
      }
    } catch (e) {
      _errorMessage = e.toString();
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

  /// Resets the controller state
  void resetState() {
    adressstate = RequestState.initial;
    address = [];
    _errorMessage = null;
    notifyListeners();
  }
}
