import 'package:flutter/material.dart';

class KaidhaFormController extends ChangeNotifier {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController grandfathername = TextEditingController();
  TextEditingController fathername = TextEditingController();
  TextEditingController familyname = TextEditingController();
  TextEditingController familynum = TextEditingController();
  TextEditingController cardnum = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController neighbborHood = TextEditingController();
  TextEditingController employerName = TextEditingController();
  TextEditingController totalSalary = TextEditingController();
  TextEditingController monthlyIncome = TextEditingController();
  String nationality = '';
  String date = '';
  int currentStage = 1;
  String birthDate = '';
  String expirationDate = '';
  String maritalStatus = '';
  String installments = '';
  String housetype = '';
  String saudiCities = "";
  String jobSpecification = "";

  void updatejobSpecification(String newjobSpecification) {
    jobSpecification = newjobSpecification;
    notifyListeners();
  }

  void updateInstallments(String newinstallments) {
    installments = newinstallments;
    notifyListeners();
  }

  void updateMaritalStatus(String newStatus) {
    maritalStatus = newStatus;
    notifyListeners();
  }

  void updateHousetype(String newhousetype) {
    housetype = newhousetype;
    notifyListeners();
  }

  void updateBirthDate(String newDate) {
    birthDate = newDate;
    notifyListeners();
  }

  void updateExpirationDate(String newexpirationDate) {
    expirationDate = newexpirationDate;
    notifyListeners();
  }

  void nextStage() {
    if (currentStage < 4) {
      currentStage++;
      notifyListeners();
    }
  }

  bool get isCompleted => currentStage >= 4;

  @override
  void dispose() {
    firstname.dispose();
    grandfathername.dispose();
    fathername.dispose();
    familyname.dispose();
    familynum.dispose();
    cardnum.dispose();
    phoneController.dispose();
    neighbborHood.dispose();
    employerName.dispose();
    totalSalary.dispose();
    monthlyIncome.dispose();
    super.dispose();
  }
}
