import 'package:flutter/material.dart';

class AddressValidationResult {
  final bool isValid;
  final String? addressError;
  final String? nameError;
  final String? phoneError;

  AddressValidationResult({
    required this.isValid,
    this.addressError,
    this.nameError,
    this.phoneError,
  });
}

AddressValidationResult validateAddressFields({
  required String address,
  required String name,
  required String phone,
}) {
  bool isValid = true;
  String? addressError;
  String? nameError;
  String? phoneError;

  // Validate address
  if (address.isEmpty) {
    addressError = "يرجى إدخال عنوان التسليم";
    isValid = false;
  }

  // Validate name
  if (name.isEmpty) {
    nameError = "يرجى إدخال اسم المتصل";
    isValid = false;
  }

  // Validate phone number
  if (phone.isEmpty) {
    phoneError = "يرجى إدخال رقم الهاتف";
    isValid = false;
  } else if (phone.length < 9) {
    phoneError = "رقم الهاتف غير صحيح";
    isValid = false;
  }

  return AddressValidationResult(
    isValid: isValid,
    addressError: addressError,
    nameError: nameError,
    phoneError: phoneError,
  );
}
