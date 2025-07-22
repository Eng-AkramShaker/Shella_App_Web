// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, avoid_print, override_on_non_overriding_member, prefer_final_fields, unused_local_variable

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/NamedFile.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/contract_pdf_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/nafath_checkStatus_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/nafath_random_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/wallet_kaidha_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/services/kaidhaSub_service_interface.dart';

class KaidhaSubscription_Controller extends ChangeNotifier {
  //

  final kaidhaSub_ServiceInterface kaidhaSubServiceInterface;

  KaidhaSubscription_Controller({required this.kaidhaSubServiceInterface});

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  WalletKaidhaModel? walletKaidhaModel;
  bool paymentMethodIndex = false;

  ContractPdfModel? contract_Pdf_Model;

  bool submit = false;

  //

  TextEditingController firstname = TextEditingController();
  TextEditingController fathername = TextEditingController();
  TextEditingController grandfathername = TextEditingController();
  TextEditingController last_name = TextEditingController();

  String birthDate = '';
  String nationality = '';
  String marital_status = '';
  TextEditingController number_of_family_members = TextEditingController();
  TextEditingController identity_card_number = TextEditingController();
  String end_date = '';

  TextEditingController phoneController = TextEditingController();
  String house_type = '';
  String city = "";
  TextEditingController neighborhood = TextEditingController();

  TextEditingController name_of_employer = TextEditingController();
  TextEditingController total_salary = TextEditingController();
  String Installments = '';

  TextEditingController monthlyIncome = TextEditingController();
  TextEditingController salary_day = TextEditingController();

  TextEditingController qr = TextEditingController();

  // ===================================================================================================================

  final FocusNode firstNameFocus = FocusNode();
  final FocusNode fatherNameFocus = FocusNode();
  final FocusNode grandFatherNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode numberOfFamilyFocus = FocusNode();
  final FocusNode identityCardFocus = FocusNode();
  final FocusNode neighborhoodFocus = FocusNode();
  final FocusNode employerFocus = FocusNode();
  final FocusNode totalSalaryFocus = FocusNode();
  final FocusNode birthDateFocus = FocusNode();
  final FocusNode nationalityFocus = FocusNode();
  final FocusNode maritalStatusFocus = FocusNode();
  final FocusNode endDateFocus = FocusNode();
  final FocusNode salaryDayFocus = FocusNode();
  final FocusNode monthlyIncomeFocus = FocusNode();

  //

  bool isFirstNameEmpty = false;
  bool isFatherNameEmpty = false;
  bool isGrandFatherNameEmpty = false;
  bool isLastNameEmpty = false;
  bool isNumberOfFamilyEmpty = false;
  bool isIdentityCardEmpty = false;
  bool isNeighborhoodEmpty = false;
  bool isEmployerEmpty = false;
  bool isTotalSalaryEmpty = false;
  bool isBirthDateEmpty = false;
  bool isNationalityEmpty = false;
  bool isMaritalStatusEmpty = false;
  bool isEndDateEmpty = false;
  bool isSalaryDayEmpty = false;
  bool isMonthlyIncomeEmpty = false;

  // 2. نعدل دالة التحقق

  static final GlobalKey nationalityKey = GlobalKey();
  static final GlobalKey birthDateKey = GlobalKey();
  static final GlobalKey numberKey = GlobalKey();
  static final GlobalKey identityCardKey = GlobalKey();
  static final GlobalKey numberOfFamilyKey = GlobalKey();
  static final GlobalKey totalSalaryKey = GlobalKey();
  static final GlobalKey endDateKey = GlobalKey();
  final GlobalKey salaryDayKey = GlobalKey();
  final GlobalKey monthlyIncomeKey = GlobalKey();

  // =================================================================================================================
  String date = '';

  String jobSpecification = "";

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool isLoading_wallet = false;

  bool get isCompleted => currentStage >= 4;

  int _currentStage = 1;
  int get currentStage => _currentStage;

  TextEditingController imgName_Controller = TextEditingController();
  List<NamedFile> All_files = [];

  int maxFiles = 5;

  TextEditingController another_amount = TextEditingController();

  bool _isLoading_Show_Pdf = false;
  bool get isLoading_Show_Pdf => _isLoading_Show_Pdf;

  NafathCheckStatusModel? _nafath_checkStatus;
  NafathCheckStatusModel? get nafath_checkStatus => _nafath_checkStatus;

  NafathRandomModel? _nafath_national_id;
  NafathRandomModel? get nafath_national_id => _nafath_national_id;

  bool _isLoading_OTP = false;
  bool get isLoading_OTP => _isLoading_OTP;

  bool _isLoading_Status = false;
  bool get isLoading_Status => _isLoading_Status;

  bool _isShow = false;
  bool get isShow => _isShow;

  // =====================================================================================

  void update_isShow() {
    _isShow = false;
    notifyListeners();
  }

  void updatejobSpecification(String newjobSpecification) {
    jobSpecification = newjobSpecification;
    notifyListeners();
  }

  void updateInstallments(String newinstallments) {
    Installments = newinstallments;
    notifyListeners();
  }

  void updateMaritalStatus(String newStatus) {
    marital_status = newStatus;
    notifyListeners();
  }

  void updateCity(String notifyListenerscity) {
    city = notifyListenerscity;
    notifyListeners();
  }

  void updateHousetype(String newhousetype) {
    house_type = newhousetype;
    notifyListeners();
  }

  void updateBirthDate(String newDate) {
    birthDate = newDate;
    notifyListeners();
  }

  void updateExpirationDate(String newexpirationDate) {
    end_date = newexpirationDate;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void nextStage(BuildContext context, {bool isNext = true}) {
    if (isNext) {
      if (_currentStage < 3) {
        _currentStage++;
        notifyListeners();
      }
    } else {
      if (_currentStage > 1) {
        _currentStage--;
        notifyListeners();
      }
    }
  }

  void backStage() {
    _currentStage = 1;
    notifyListeners();
  }

  // =====

  void onChange_another_amount(String amount) {
    another_amount.text = amount;
    notifyListeners();
  }

  // Nafath   dialog    ================================================================================================

  Future onChange_dialog(BuildContext context, String nationalId) async {
    //

    // Get.dialog(
    //   barrierDismissible: false,
    //   ConfirmationDialog(
    //     icon: Images.warning,
    //     title: "هل قمت بالمصادقة داخل تطبيق نفاذ ؟",
    //     description: "هذه مرحه تحقق هل تم تأكيد الكود بنجاح أم لا ",
    //     onYesPressed: () async {
    //       //
    //       Get.back();
    //       await Nafath_send_checkStatus(context, nationalId);
    //     },
    //   ),
    // );
  }

  // Status  ==========

  Future<NafathCheckStatusModel?> Nafath_send_checkStatus(BuildContext context, String nationalId) async {
    _nafath_checkStatus = null;
    _isLoading_Status = true;
    notifyListeners();

    final onValue = await kaidhaSubServiceInterface.Nafath_send_checkStatus(context, nationalId);

    if (onValue != null) {
      _nafath_checkStatus = onValue;

      if (onValue.status == "approved") {
        debugPrint("\x1B[32m  /${onValue.status}  \x1B[0m");

        _isShow = true;
        notifyListeners();

        showCustomSnackBar(context, "لقد تم تحقق المصادقة بنجاح", isError: false);
      } else {
        _isShow = false;
        notifyListeners();
        showCustomSnackBar(context, "لم تقم بالمصادقة من داخل تطبيق نفاذ");
      }
    } else {
      _isShow = false;
      notifyListeners();
      showCustomSnackBar(context, "حدث خطأ أثناء التحقق من المصادقة");
    }

    _isLoading_Status = false;

    notifyListeners();
    return _nafath_checkStatus;
  }

  // send National Id  OTP  ==========

  Future<NafathRandomModel?> Nafath_send_National_Id(BuildContext context, String nationalId) async {
    //

    _nafath_national_id = null;
    _isLoading_OTP = true;
    notifyListeners();

    _nafath_national_id = await kaidhaSubServiceInterface.Nafath_send_National_Id(context, nationalId);

    _isLoading_OTP = false;

    notifyListeners();
    return null;
  }

  // send All  Data   =============

  Future<Response?> Nafath_send_All_Data(
    BuildContext context,
    String national_id,
    String city,
    String neighborhood,
    String house_type,
  ) async {
    _isLoading = true;
    notifyListeners();

    debugPrint("\x1B[32m  /$national_id  \x1B[0m");
    debugPrint("\x1B[32m city /$city  \x1B[0m");
    debugPrint("\x1B[32m  neighborhood/ $neighborhood  \x1B[0m");
    debugPrint("\x1B[32m  house_type/ $house_type  \x1B[0m");

    try {
      Response response = await kaidhaSubServiceInterface.Nafath_send_All_Data(context, national_id, city, neighborhood, house_type);

      return response;
    } catch (e) {
      return null;
    } finally {
      _nafath_checkStatus = null;
      _isLoading = false;
      notifyListeners();
    }
  }

  //   =====================================================================================================

  void pickFileWithName(BuildContext context) async {
    if (imgName_Controller.text.trim().isEmpty) {
      showCustomSnackBar(context, 'يرجى إدخال الاسم');

      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );

    if (result != null) {
      All_files.add(NamedFile(name: imgName_Controller.text.trim(), file: result.files.first));
      notifyListeners();
    }

    imgName_Controller.clear();
  }

  void removeFile(int index) {
    All_files.removeAt(index);
    notifyListeners();
  }

//  ----------------------------------------------------------------------------

  Future get_Wallet_Kaidh() async {
    isLoading_wallet = true;
    notifyListeners();

    try {
      walletKaidhaModel = await kaidhaSubServiceInterface.getWalletKaidh();
    } catch (e) {
      print("Error fetching wallet: $e");
    }
    isLoading_wallet = false;
    notifyListeners();
  }

  // ---------------------------------------------------------------------------

  Future Submit_Store_Info(context) async {
    _isLoading_Status = true;
    notifyListeners();

    // final address = AddressHelper.getUserAddressFromSharedPref();

    // KaidhaSubModel kaidhaSub = KaidhaSubModel(
    //   first_name: firstname.text,
    //   father_name: fathername.text,
    //   grandfather_name: grandfathername.text,
    //   last_name: last_name.text,
    //   birth_date: birthDate,
    //   national_id: nationality,
    //   marital_status: marital_status,
    //   number_of_family_members: number_of_family_members.text,
    //   identity_card_number: identity_card_number.text,
    //   end_date: end_date,
    //   mobile: phoneController.text.isEmpty ? Get.find<ProfileController>().userInfoModel!.phone.toString() : phoneController.text,

    //   house_type: 'apartment',
    //   city: 'damascus',

    //   neighborhood: address!.address.toString() ?? "",

    //   name_of_employer: name_of_employer.text,
    //   total_salary: total_salary.text,
    //   installments: Installments,
    //   source_of_income: 'government',

    //   // source_of_income: jobSpecification,

    //   monthly_amount: monthlyIncome.text,
    //   // salary_day: salary_day.text,
    //   salary_day: "2",

    // );

    // await kaidhaSubServiceInterface.Stor_info(context, kaidhaSub, All_files).then((value) async {
    //   //

    //   debugPrint("\x1B[32m     Submit_Store_Info  $value      \x1B[0m");

    //   if (value == true) {
    //     backStage();
    //     Get.toNamed(RouteHelper.getKiadaWalletSubscription());

    //     clearForm();
    //     await get_Wallet_Kaidh();
    //     await get_Pdf();
    //   }
    // });

    _nafath_checkStatus = null;
    _isLoading_Status = false;
    _isShow = false;
    notifyListeners();
  }

  //

  // Payment =================================================

  // Future<bool> add_Payment(BuildContext context, CheckoutController checkoutController, double amount) async {
  //   //

  //   _isLoading = true;
  //   notifyListeners();

  //   if (checkoutController.select_payment_Methods != null) {
  //     bool isSuccess = await checkoutController.Pay(context, "$amount");

  //     // إعادة تعيين بعد الدفع
  //     if (isSuccess == true) {
  //       checkoutController.select_payment_Methods = null;

  //       notifyListeners();
  //     }

  //     _isLoading = false;
  //     notifyListeners();
  //     return isSuccess;
  //   } else {
  //     _isLoading = false;
  //     notifyListeners();
  //     return false;
  //   }
  // }

  // get_Pdf  ================================================

  Future<void> get_Pdf() async {
    _isLoading_Show_Pdf = true;
    notifyListeners();

    try {
      get_Wallet_Kaidh();
      contract_Pdf_Model = await kaidhaSubServiceInterface.get_Pdf();
    } catch (e) {
      print("خطأ في تحميل PDF: ");
    } finally {
      _isLoading_Show_Pdf = false;
      notifyListeners();
    }
  }

  // شحن  =================================================

  Future Send_Pay_Credit(context, double total) async {
    _isLoading = true;
    notifyListeners();

    // CheckoutController checkoutController = Get.find<CheckoutController>();

    // ماي فاتوره =========================================

    // checkoutController.selectedButton = 1;

    // notifyListeners();

    // checkoutController.setPaymentMethod(0, isnotifyListeners: true);

    // if (checkoutController.isKaidhaPay == true) {
    //   //"قيدها"
    //   checkoutController.change_Kaidha_Pay();
    // }

    // if (checkoutController.isMy_Pay == true) {
    //   //عادي
    //   checkoutController.change_My_Pay();
    // }

    // await Get.bottomSheet(
    //   const PaymentMethodBottomSheet(),
    //   backgroundColor: Colors.transparent,
    //   isScrollControlled: true,
    // ).then((onValue) async {
    //   bool isPaymentSuccessful = await checkoutController.Pay(context, "$total");

    //   if (isPaymentSuccessful == false) {
    //      showCustomSnackBar(context,"فشلت عملية الشحن قم بالمحاولة ثانيا ");

    //     return "";
    //   } else {
    //     await kaidhaSubServiceInterface.send_Pay_credit(context, total);
    //   }
    // });

    // ----------------------------------------------------------------------------------------------

    _isLoading = false;
    notifyListeners();
  }

  // شراء   =============================================

  Future<bool> Send_Pay_Bebit(context, double total) async {
    return await kaidhaSubServiceInterface.send_Pay_debit(context, total);
  }

  // -------------------------------

  void validate_Fields_Screen_1(BuildContext context) {
    isFirstNameEmpty = firstname.text.isEmpty;
    isFatherNameEmpty = fathername.text.isEmpty;
    isGrandFatherNameEmpty = grandfathername.text.isEmpty;
    isLastNameEmpty = last_name.text.isEmpty;
    isNumberOfFamilyEmpty = number_of_family_members.text.isEmpty;
    isIdentityCardEmpty = identity_card_number.text.isEmpty;
    isNeighborhoodEmpty = neighborhood.text.isEmpty;
    isEmployerEmpty = name_of_employer.text.isEmpty;
    isTotalSalaryEmpty = total_salary.text.isEmpty;
    isBirthDateEmpty = birthDate.isEmpty;
    isNationalityEmpty = nationality.isEmpty;
    isMaritalStatusEmpty = marital_status.isEmpty;
    isEndDateEmpty = end_date.isEmpty;
    isSalaryDayEmpty = end_date.isEmpty;

    notifyListeners();

    if (isFirstNameEmpty) {
      FocusScope.of(context).requestFocus(firstNameFocus);
      return;
    }
    if (isFatherNameEmpty) {
      FocusScope.of(context).requestFocus(fatherNameFocus);
      return;
    }
    if (isGrandFatherNameEmpty) {
      FocusScope.of(context).requestFocus(grandFatherNameFocus);
      return;
    }
    if (isLastNameEmpty) {
      FocusScope.of(context).requestFocus(lastNameFocus);
      return;
    }
    if (birthDate.isEmpty) {
      {
        isBirthDateEmpty = true;
        notifyListeners();

        Scrollable.ensureVisible(
          birthDateKey.currentContext!,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        return;
      }
    }

    if (nationality.isEmpty) {
      isNationalityEmpty = true;
      notifyListeners();
    }
    if (nationality.isEmpty) {
      isNationalityEmpty = true;
      notifyListeners();

      // التمرير إلى العنصر
      Scrollable.ensureVisible(
        nationalityKey.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      return;
    }

    if (isMaritalStatusEmpty) {
      showCustomSnackBar(context, "يرجى تحديد الحالة الاجتماعية");
      return;
    }
    if (number_of_family_members.text.isEmpty) {
      isNumberOfFamilyEmpty = true;
      notifyListeners();

      Scrollable.ensureVisible(
        numberKey.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      numberOfFamilyFocus.requestFocus();
      return;
    }

    if (isIdentityCardEmpty) {
      FocusScope.of(context).requestFocus(identityCardFocus);
      return;
    }
    if (end_date.isEmpty) {
      isEndDateEmpty = true;
      notifyListeners();

      Scrollable.ensureVisible(
        endDateKey.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      endDateFocus.requestFocus();
      return;
    }

    if (isEmployerEmpty) {
      FocusScope.of(context).requestFocus(employerFocus);
      return;
    }
    if (isNeighborhoodEmpty) {
      FocusScope.of(context).requestFocus(neighborhoodFocus);
      return;
    }
    if (total_salary.text.isEmpty) {
      isTotalSalaryEmpty = true;
      notifyListeners();
      Scrollable.ensureVisible(
        totalSalaryKey.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      totalSalaryFocus.requestFocus();
      return;
    }

    nextStage(context, isNext: true);
  }

  void validate_Fields_Screen_2(BuildContext context, String nationalId) async {
    //
    // nextStage(context, isNext: true);

    if (jobSpecification.isEmpty || salary_day.text.isEmpty || monthlyIncome.text.isEmpty) {
      if (salary_day.text.isEmpty) {
        isSalaryDayEmpty = true;
        notifyListeners();

        // التمرير والتركيز على حقل يوم الراتب
        if (salaryDayFocus.hasFocus == false) {
          salaryDayFocus.requestFocus();
        }

        if (salaryDayKey.currentContext != null) {
          Scrollable.ensureVisible(
            salaryDayKey.currentContext!,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }

        return;
      }

      if (monthlyIncome.text.isEmpty) {
        isMonthlyIncomeEmpty = true;
        notifyListeners();

        if (!monthlyIncomeFocus.hasFocus) {
          monthlyIncomeFocus.requestFocus();
        }

        if (monthlyIncomeKey.currentContext != null) {
          Scrollable.ensureVisible(
            monthlyIncomeKey.currentContext!,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }

        return;
      }
      return;
    }

    if (All_files.isEmpty) {
      showCustomSnackBar(context, "لم يتم حفظ اي مستند");
      return;
    }

    if (identity_card_number.text.isNotEmpty) {
      await Nafath_send_National_Id(context, nationalId).then((onValue) async {
        if (nafath_national_id != null && nafath_national_id!.status == "sent") {
          nextStage(context, isNext: true);
        }
      });
    }
  }

  @override
  void clearForm() {
    // Clear TextEditingControllers
    firstname.clear();
    fathername.clear();
    grandfathername.clear();
    last_name.clear();
    number_of_family_members.clear();
    identity_card_number.clear();
    phoneController.clear();
    neighborhood.clear();
    name_of_employer.clear();
    total_salary.clear();
    salary_day.clear();
    monthlyIncome.clear();
    jobSpecification = '';
    qr.clear();

    // Clear dropdowns / selected values
    birthDate = '';
    nationality = '';
    marital_status = '';
    end_date = '';
    house_type = '';
    city = '';
    Installments = '';

    // Clear selected files or lists
    All_files = [];

    // Reset error states if you use them
    isFirstNameEmpty = false;
    isFatherNameEmpty = false;
    isGrandFatherNameEmpty = false;
    isLastNameEmpty = false;
    isNumberOfFamilyEmpty = false;
    isIdentityCardEmpty = false;
    isNeighborhoodEmpty = false;
    isEmployerEmpty = false;
    isTotalSalaryEmpty = false;
    isBirthDateEmpty = false;
    isNationalityEmpty = false;
    isMaritalStatusEmpty = false;
    isEndDateEmpty = false;
    isMonthlyIncomeEmpty = false;

    // Call notifyListeners to refresh UI if using GetX
    notifyListeners();
  }
}
