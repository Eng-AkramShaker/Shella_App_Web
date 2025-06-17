import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:shella_design/features/join_as_driver/domain/models/join_as_driver_model.dart';
import 'package:shella_design/features/join_as_driver/domain/services/joinAsDriverServices/join_as_driver_services.dart';
class DriverRegisterController extends ChangeNotifier {
  File? profilePicture;
  String firstName = '';
  String lastName = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isLoading = false;
  String? errorMessage;
  void setProfilePicture(File file) {
    profilePicture = file;
    notifyListeners();
    debugPrint('✅ تم تحديد صورة الحساب: ${file.path}');
  }
  
  void setFirstName(String fname) {
    firstName = fname;
    notifyListeners();
    debugPrint('✅ تم تحديد الأسم الأول: $firstName');
  }
  void setLastName(String lname) {
    lastName = lname;
    notifyListeners();
    debugPrint('✅ تم تحديد الأسم الأخير: $lastName');
  }
  void setPhone(String phoneNumber) {
    phone = phoneNumber;
    notifyListeners();
    debugPrint('✅ تم تحديد التليفون: $phone');
  }
  void setEmail(String emailAddress) {
    email = emailAddress;
    notifyListeners();
    debugPrint('✅ تم تحديد الايميل: $email');
  }
  void setPassword(String pass) {
    password = pass;
    notifyListeners();
    debugPrint('✅ تم تحديد الباسورد');
  }
   final DeliveryManService deliveryManService;

  DriverRegisterController({required this.deliveryManService});
  
  Future<bool> registerDriver() async {
    if (profilePicture == null ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      debugPrint('❌ بيانات غير مكتملة للتسجيل');
      return false;
    }
    isLoading = true;
    notifyListeners();

    DeliveryManBody deliveryManBody = DeliveryManBody(
      fName: firstName,
      lName: lastName,
      phone: phone,
      email: email,
      password: password,
      identityType: 'passport',
      identityNumber: '0101010101',
      //earning: 1,
      zoneId: 2,
      //vehicleId: 1,
      imagePath: profilePicture!.path,
    );

    bool result = await deliveryManService.register(deliveryManBody);

    isLoading = false;
    notifyListeners();

    return result;
  }
}
