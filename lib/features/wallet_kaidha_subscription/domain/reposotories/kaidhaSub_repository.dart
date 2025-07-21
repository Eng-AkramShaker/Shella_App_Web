// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, use_build_context_synchronously, depend_on_referenced_packages, annotate_overrides, unused_local_variable, empty_catches, override_on_non_overriding_member

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:shella_design/api/api_client.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/common/widgets/dialog/wallet_dialog.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/NamedFile.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/contract_pdf_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/kaidhaSub_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/nafath_checkStatus_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/nafath_random_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/response_api_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/models/wallet_kaidha_model.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/domain/reposotories/kaidhaSub_repository_interface.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/widget/dialog.dart/success_dialog.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class KaidhaSubRepository implements KaidhaSubRepositoryInterface {
  final ApiClient apiClient;
  http.MultipartFile? signatureFile;

  KaidhaSubRepository({required this.apiClient, this.signatureFile});

  // -----------------------------
  @override
  Future<bool> Stor_info(context, KaidhaSubModel kaidhaSub, List<NamedFile> list_img) async {
    if (apiClient.token == null || apiClient.token!.isEmpty) {
      print("⚠️ لا يوجد توكن.  ");
      return false;
    }

    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer ${apiClient.token}'};

    var uri = Uri.parse(ApiConstants.appBaseUrl + ApiConstants.store_qidhaUri);

    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(headers);

    request.fields.clear();
    kaidhaSub.toJson().forEach((key, value) {
      request.fields[key] = value.toString();
    });

    if (list_img.isNotEmpty) {
      for (var file in list_img) {
        if (file.file.path != null && file.file.path!.isNotEmpty) {
          request.files.add(await http.MultipartFile.fromPath('attachments[]', file.file.path!));
        }
      }
    } else {
      print('❌ لا توجد ملفات مرفقة');
    }

    // ==========================================

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();

    debugPrint("\x1B[32m   Stor_info:   ${response.statusCode}  \x1B[0m");

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> decodedJson = jsonDecode(responseBody);
      ResponseApiIncomeSourceModel model = ResponseApiIncomeSourceModel.fromJson(decodedJson);

      print('✅ تم الإرسال بنجاح: ${model.message}');

      show_walletDialog(context, SuccessDialog());

      return true;
    } else {
      Map<String, dynamic> decodedJson = jsonDecode(responseBody);
      ResponseApiIncomeSourceModel model = ResponseApiIncomeSourceModel.fromJson(decodedJson);

      if (model.errors != null) {
        String firstError = '';

        if (model.errors?.firstName != null && model.errors!.firstName!.isNotEmpty) {
          firstError = 'حقل الاسم الأول مطلوب';
        } else if (model.errors?.grandfatherName != null && model.errors!.grandfatherName!.isNotEmpty) {
          firstError = 'حقل اسم الجد مطلوب';
        } else if (model.errors?.fatherName != null && model.errors!.fatherName!.isNotEmpty) {
          firstError = 'حقل اسم الأب مطلوب';
        } else if (model.errors?.lastName != null && model.errors!.lastName!.isNotEmpty) {
          firstError = 'حقل اسم العائلة مطلوب';
        } else if (model.errors?.birthDate != null && model.errors!.birthDate!.isNotEmpty) {
          firstError = 'حقل تاريخ الميلاد مطلوب';
        } else if (model.errors?.nationalId != null && model.errors!.nationalId!.isNotEmpty) {
          firstError = "لديك حساب قيدها بالفعل";
        } else if (model.errors?.maritalStatus != null && model.errors!.maritalStatus!.isNotEmpty) {
          firstError = 'حقل الحالة الاجتماعية مطلوب';
          //   } else if (model.errors?.numberOfFamilyMembers != null && model.errors!.numberOfFamilyMembers!.isNotEmpty) {
          //   firstError = 'حقل عدد أفراد الأسرة مطلوب';
        } else if (model.errors?.identityCardNumber != null && model.errors!.identityCardNumber!.isNotEmpty) {
          firstError = "لديك حساب قيدها بالفعل";
        } else if (model.errors?.endDate != null && model.errors!.endDate!.isNotEmpty) {
          firstError = 'حقل تاريخ انتهاء البطاقة مطلوب';
        } else if (model.errors?.mobile != null && model.errors!.mobile!.isNotEmpty) {
          firstError = 'حقل رقم الهاتف مطلوب';
        } else if (model.errors?.houseType != null && model.errors!.houseType!.isNotEmpty) {
          firstError = 'حقل نوع المنزل مطلوب';
        } else if (model.errors?.city != null && model.errors!.city!.isNotEmpty) {
          firstError = 'حقل المدينة مطلوب';
        } else if (model.errors?.neighborhood != null && model.errors!.neighborhood!.isNotEmpty) {
          firstError = 'حقل الحي مطلوب';
        } else if (model.errors?.nameOfEmployer != null && model.errors!.nameOfEmployer!.isNotEmpty) {
          firstError = 'حقل اسم صاحب العمل مطلوب';
        } else if (model.errors?.totalSalary != null && model.errors!.totalSalary!.isNotEmpty) {
          firstError = 'حقل الراتب الإجمالي مطلوب';
        } else if (model.errors?.installments != null && model.errors!.installments!.isNotEmpty) {
          firstError = 'حقل الأقساط مطلوب';
        } else {
          firstError = '4حدث خطأ غير معروف';
        }
        showCustomSnackBar(firstError);
        return false;
      } else {
        showCustomSnackBar("الرجاء أعد المحاوله في وقت أخر");
        return false;
      }
    }
  }

  // ---
  WalletKaidhaModel? _walletKaidhaCache;

  @override
  Future<WalletKaidhaModel?> getWalletKaidh({bool forceRefresh = false}) async {
    if (apiClient.token == null || apiClient.token!.isEmpty) {
      print("⚠️ لا يوجد توكن. لن يتم تنفيذ طلب المحفظة.");
      return null;
    }

    // try {
    //   Response response = await apiClient.getData(ApiConstants.get_walletUri);

    //   if (response.statusCode == 200 || response.statusCode == 201 && response.body != null) {
    //     _walletKaidhaCache = WalletKaidhaModel.fromJson(response.body);
    //     print("✅ محفظه قيدها: ${_walletKaidhaCache!.wallet?.status}");
    //     return _walletKaidhaCache;
    //   } else {
    //     print("❌ فشل استرجاع المحفظة: كود ${response.statusCode}");
    //   }
    // } catch (e) {
    //   print("❌ استثناء أثناء استرجاع المحفظة: $e");
    // }

    return null;
  }

  // get_Pdf  ==========================================================================================================

  @override
  Future<ContractPdfModel> get_Pdf() async {
    //

    ContractPdfModel? Pdf_Model;

    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer ${apiClient.token}'};
    try {
      final request = http.Request('GET', Uri.parse("${ApiConstants.appBaseUrl}/api/qidha-wallet/contract-pdf"));

      request.headers.addAll(headers);

      print('📤 جاري جلب عقد PDF من الخادم...');

      final streamedResponse = await request.send();

      if (streamedResponse.statusCode == 200 || streamedResponse.statusCode == 201) {
        final bytes = await streamedResponse.stream.toBytes();

        if (bytes.isEmpty) {
          print('⚠️ تم استلام ملف فارغ');
          return Pdf_Model!;
        }

        final dir = await getTemporaryDirectory();
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final filePath = '${dir.path}/contract_$timestamp.pdf';

        await File(filePath).writeAsBytes(bytes);

        print('✅ تم تنزيل العقد (${bytes.length} بايت)');
        print('📁 المسار: $filePath');
        Pdf_Model = ContractPdfModel(filePath: filePath, fileSize: bytes.length);

        return Pdf_Model;
      } else {
        print('❌ فشل التنزيل - الرمز: ${streamedResponse.statusCode}');
        print('📄 السبب: ${streamedResponse.reasonPhrase}');
        return Pdf_Model!;
      }
    } catch (e) {
      print('❌ حدث خطأ غير متوقع:  ');
      print('🔍 التفاصيل:  ');
      return Pdf_Model!;
    }
  }

  // ---

  // Credit شحن الرصيد ================================================================================================

  @override
  Future<Response> send_Pay_credit(context, double total) async {
    Map<String, dynamic> data = {
      'amount': total,
    };

    Response? response;

    // await apiClient.postData(ApiConstants.pay_creditUri, data);

    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   getWalletKaidh();

    //   showCustomSnackBar("${response.body["message"]}", isError: false);
    // } else {
    //   showCustomSnackBar("فشل شحن المبلغ");
    // }

    return response!;
  }

  //  شراء  debi  =====================================================================================================

  @override
  Future<bool> send_Pay_debit(context, double total) async {
    Map<String, dynamic> data = {
      'amount': total,
    };

    Response? response;
    // Response response = await apiClient.postData(ApiConstants.pay_debitUri, data);

    if (response!.statusCode == 200 || response.statusCode == 201) {
      getWalletKaidh();
      return true;
    } else if (response.statusCode == 429) {
      //

      return false;
    } else {
      showCustomSnackBar("فشل الشراء ");
      return false;
    }
  }

  //
  // ==============

  // Nafath    ================================================================================================

  @override
  Future<NafathCheckStatusModel?> Nafath_send_checkStatus(BuildContext context, String nationalId) async {
    if (apiClient.token == null || apiClient.token!.isEmpty) {
      print("⚠️ لا يوجد توكن. لن يتم تنفيذ طلب المحفظة.");
      return null;
    }

    try {
      Map<String, String> data = {
        'national_id': nationalId,
      };

      // إرسال الطلب

      Response? response;
      // Response response = await apiClient.postData(AppConstants.nafath_checkStatusUri, data);

      if ((response!.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        NafathCheckStatusModel checkStatus = NafathCheckStatusModel.fromJson(response.body);

        print("✅ حالة Nafath: ${response.body}");

        return checkStatus;
      } else {
        print("❌ Nafath فشل   ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Nafath فشل    ");
      return null;
    }
  }

  // send National Id   =========================

  Future<NafathRandomModel?> Nafath_send_National_Id(BuildContext context, String nationalId) async {
    NafathRandomModel model = NafathRandomModel();

    try {
      if (nationalId.length != 10 || !RegExp(r'^\d{10}$').hasMatch(nationalId)) {
        showCustomSnackBar("رقم الهوية غير صالح");
      }

      Map<String, String> data = {'national_id': nationalId};
      Response? response;

      // Response response = await apiClient.postData(AppConstants.nafath_initiateUri, data);

      if ((response!.statusCode == 200 || response.statusCode == 201)) {
        model = NafathRandomModel.fromJson(response.body);

        return model;
      } else if (response.statusCode == 422) {
        showCustomSnackBar("رقم الهوية غير صحيح أو مرفوض");
      } else {
        showCustomSnackBar("رقم الهوية غير صحيح أو مرفوض");
        return model;
      }
    } catch (e) {
      showCustomSnackBar("رقم الهوية غير صحيح أو مرفوض");

      return model;
    }
    return null;
  }

  // send All  Data   =========================

// هذه الدالة ترجع الملف المحمل والمحفوظ مؤقتاً

  @override
  Future<Response> Nafath_send_All_Data(
    BuildContext context,
    String nationalId,
    String city,
    String neighborhood,
    String houseType,
  ) async {
    final Map<String, String> payload = {
      'national_id': nationalId,
      'city': city,
      'neighborhood': neighborhood,
      'house_type': houseType,
    };
    // await apiClient.postData(AppConstants.nafath_signUri, payload);

    Response? response;
    return response!;
  }

  //
}
