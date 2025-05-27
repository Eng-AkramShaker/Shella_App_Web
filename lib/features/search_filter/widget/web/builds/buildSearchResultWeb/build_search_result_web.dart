import 'package:flutter/material.dart';
import 'package:shella_design/features/search_filter/widget/web/builds/buildSearchResultWeb/searchResultFilterWeb/search_result_filter_web.dart';
import '../../../../../../common/widgets/gap/height/height.dart';
import '../../../../../../common/widgets/gap/width/width.dart';
import '../../../../controller/search_filter_controller.dart';
import '../../../mobile/builds/buildFilterCategory/build_filter_category.dart';
import '../../itemLoadingWeb/item_loading_web.dart';
import 'searchResultContainerWeb/search_result_container_web.dart';
import 'searchResultListViewWeb/search_result_list_view_web.dart';

class BuildSearchResultWeb extends StatelessWidget {
  const BuildSearchResultWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context,0.55),
      child: Column(
        children: [
          SearchResultFilterWeb(),
          SizedBox(height: 10,),
          SearchFilterController.get(context).state==SearchState.loading?
          ItemLoadingWeb():
          SearchFilterController.get(context).searchResultModel==null?
          SizedBox():
          SearchFilterController.get(context).isListView==true?
          SearchResultListViewWeb():
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 30,right: 10,top: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15,childAspectRatio: (width(context, 1)/2)/height(context, 0.77)),
            itemBuilder: (context, index) => SearchResultContainerWeb(
              itemImg: SearchFilterController.get(context).mixedList[index]['img']??'',
              itemName: SearchFilterController.get(context).mixedList[index]['name']??'',
              rate: '4.5',
              index: index,
            ),
            itemCount: SearchFilterController.get(context).mixedList.length,
          ),
        ],
      ),
    );
  }
}