import 'dart:convert';
import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/features/product/domain/repositories/productRepository/product_repository_interface.dart';
import '../../../../../api/api_client.dart';
import '../../../../../common/helper/check_Logged.dart';
import '../../../../../common/util/Api_constants.dart';
import '../../../../../common/widgets/print/custom_print.dart';

class ProductRepository extends ProductRepositoryInterface{

  ///-------------------------------------<<<---GET STORE DETAILS--->>>-------------------------------------
  @override
  Future<Response?> getStoreDetails({required String storeId}) async {
    Response? response = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.storeDetails+storeId);
    customPrint('Get Store Details Response :: ${jsonDecode(response!.body)}');
    return response;
  }
}