import 'package:flutter/foundation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class ValidateCheck {
  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final kEmailValid = RegExp(pattern);
    bool isValid = kEmailValid.hasMatch(value.toString());
    if (value!.isEmpty) {
      return '⚠ Email field is required';
    } else if (isValid == false) {
      return '⚠ Enter valid email address';
    }
    return null;
  }

  static String? validateEmptyText(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message ?? 'This field is required';
    }
    return null;
  }

  static String? validatePhone(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message ?? 'This field is required';
    }
    return null;
  }

  static String? validatePassword(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message ?? 'This field is required';
    } else if (value.length < 8) {
      return 'Minimum password length is 8 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password field is required';
    } else if (value != password) {
      return 'Confirm password does not match';
    }
    return null;
  }

  static String? loyaltyCheck(
      String? value, int? minimumExchangePoint, int? point) {
    int amount = 0;
    if (value != null && value.isNotEmpty) {
      amount = int.parse(value);
    }
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (amount < minimumExchangePoint!) {
      return 'Please exchange more than $minimumExchangePoint points';
    } else if (point! < amount) {
      return 'You do not have enough points to exchange';
    }
    return null;
  }

  static String getValidPhone(String number, {bool withCountryCode = false}) {
    bool isValid = false;
    String phone = "";

    try {
      PhoneNumber phoneNumber = PhoneNumber.parse(number);
      isValid = phoneNumber.isValid(type: PhoneNumberType.mobile);
      if (isValid) {
        phone = withCountryCode
            ? "+${phoneNumber.countryCode}${phoneNumber.nsn}"
            : phoneNumber.nsn.toString();
        if (kDebugMode) {
          print("Phone Number : $phone");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return phone;
  }
}
