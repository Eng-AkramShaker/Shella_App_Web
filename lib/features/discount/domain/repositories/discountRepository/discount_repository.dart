
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shella_design/features/discount/domain/repositories/discountRepositoryInterface/discount_repository_interface.dart';
import '../../../../../api/api_client.dart';
import '../../../../../common/helper/check_Logged.dart';
import '../../../../../common/util/Api_constants.dart';

class DiscountRepository implements DiscountRepositoryInterface{

  @override
  Future<http.Response?> fetchDiscountedProducts({offset}) async {
    http.Response? response  = await ApiClient(appBaseUrl: Api_Constants.appBaseUrl,sharedPreferences: sp<SharedPreferences>()).getData(Api_Constants.discountProducts,headers: {'type': 'all','offset': offset,'limit': '50'});
    return response;
  }
}
