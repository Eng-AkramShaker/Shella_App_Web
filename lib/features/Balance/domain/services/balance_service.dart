import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shella_design/common/models/response_model.dart';
import 'package:shella_design/features/Balance/domain/repositories/balance_repository_interface.dart';
import 'package:shella_design/features/Balance/domain/services/balance_service_interface.dart';

class BalanceService implements BalanceServiceInterface {
  final BalanceRepositoryInterface balanceRepositoryInterface;

  BalanceService({required this.balanceRepositoryInterface});

  @override
  Future<ResponseModel> addFund(
      {required String amount, required String paymentMethod}) async {
    try {
      http.Response? response = await balanceRepositoryInterface.addFund(
        amount: amount,
        paymentMethod: paymentMethod,
      );

      if (response == null) {
        log('AddFund Error: No response');
        return ResponseModel(false, 'لا يوجد استجابة من الخادم');
      }

      if (response.statusCode == 200) {
        // Parse response data
        var responseData = jsonDecode(response.body);
        log('AddFund Response: $responseData');
        return ResponseModel(true, 'تم إضافة الرصيد بنجاح');
      } else {
        // Handle different error status codes
        log('AddFund Error: ${response.statusCode}, Body: ${response.body}');

        // Try to extract error message from response body if possible
        String errorMessage = 'عذراً، تعذر إتمام العملية';
        try {
          final responseBody = jsonDecode(response.body);
          if (responseBody != null && responseBody['message'] != null) {
            errorMessage = responseBody['message'];
          } else if (response.statusCode == 400) {
            errorMessage = 'عذراً أن رصيد المحفظة غير كافي لاجراء العملية';
          } else if (response.statusCode == 401) {
            errorMessage = 'يرجى تسجيل الدخول للمتابعة';
          }
        } catch (e) {
          log('Error parsing response body: $e');
        }

        return ResponseModel(false, errorMessage);
      }
    } catch (e) {
      log('AddFund Exception: $e');
      return ResponseModel(false, 'حدث خطأ أثناء إضافة الرصيد');
    }
  }
}
