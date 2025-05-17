import 'package:shella_design/features/search_filter/domain/models/searchResultModel/search_result_model.dart';

abstract class SearchServiceInterface {
  Future<SearchResultModel> searchItems({value});
}