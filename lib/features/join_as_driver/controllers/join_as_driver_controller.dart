import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:shella_design/features/join_as_driver/domain/models/join_as_driver_model.dart';
import 'package:shella_design/features/join_as_driver/domain/services/joinAsDriverServices/join_as_driver_services.dart';

class DriverRegisterController extends ChangeNotifier {
  File? profilePicture;
  File? licensePicture;
  String firstName = '';
  String lastName = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isLoading = false;
  String? errorMessage;
  String earning = '';
  String vechileId = '';
  String zoneId = '';
  String identityType = '';
  String identityNumber = '';
  void setProfilePicture(File file) {
    profilePicture = file;
    notifyListeners();
    debugPrint('✅ تم تحديد صورة الحساب: ${file.path}');
  }

  void setLicensePicture(File file) {
    licensePicture = file;
    notifyListeners();
    debugPrint('✅ تم تحديد صورة الشهادة: ${file.path}');
  }

  void setFirstName(String fname) {
    firstName = fname;
    notifyListeners();
    debugPrint('✅ تم تحديد الأسم الأول: $firstName');
  }

  void setIdentityNumber(String identityNumberr) {
    identityNumber = identityNumberr;
    notifyListeners();
    debugPrint('✅ تم تحديد رقم الهوية : ');
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

  void setEarning(String earnings) {
    earning = earnings;
    notifyListeners();
    debugPrint('✅ تم تحديد الربح');
  }

  void setVechileId(String vechileIdd) {
    vechileId = vechileIdd;
    notifyListeners();
    debugPrint('✅ تم تحديد نوع المركبة');
  }

  void setZoneId(String zoneIdd) {
    zoneId = zoneIdd;
    notifyListeners();
    debugPrint('✅ تم تحديد نوع الزون');
  }

  void setIdentityType(String identityTypee) {
    identityType = identityTypee;
    notifyListeners();
    debugPrint('✅ تم تحديد نوع الرخصة');
  }

  final DeliveryManService deliveryManService;

  DriverRegisterController({required this.deliveryManService});

  Future<bool> registerDriver() async {
    if (profilePicture == null ||
        licensePicture == null ||
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
      licenseImagePath: licensePicture!.path,
      fName: firstName,
      lName: lastName,
      phone: phone,
      email: email,
      password: password,
      identityType: 'passport',
      identityNumber: identityNumber,
      //earning: 1,
      zoneId: zoneId,
      //vehicleId: 1,
      imagePathProfile: profilePicture!.path, vehicleId: vechileId,
      earning: earning,
    );

    bool result = await deliveryManService.register(deliveryManBody);

    isLoading = false;
    notifyListeners();

    return result;
  }
}
