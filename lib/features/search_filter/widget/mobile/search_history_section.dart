import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'builds/build_search_item.dart';

class SearchHistorySection extends StatelessWidget {
  final List previousSearches;
  final BuildContext context;

  const SearchHistorySection({
    super.key,
    required this.previousSearches,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(context, text: "بحثت مسبقا عن", style: font10Grey400W(context, size: size_12(context))),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            reverse: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                Provider.of<SearchFilterController>(context,listen: false).setSearchValue(value: previousSearches[index],index: index);
              },
              behavior: HitTestBehavior.opaque,
              child: buildSearchItem(context, previousSearches[index],index)),
            itemCount: previousSearches.length
          ),
        ],
      ),
    );
  }
}
