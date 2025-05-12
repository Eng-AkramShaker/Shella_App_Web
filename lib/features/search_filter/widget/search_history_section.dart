import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/search_filter/widget/builds/build_search_item.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class SearchHistorySection extends StatelessWidget {
  final List<String> previousSearches;
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
          Custom_Text(context, text: "بحثت مسبقا عن", style: font10Grey400W(context, size: size_10(context))),
          ...previousSearches.map((text) => buildSearchItem(context, text)),
        ],
      ),
    );
  }
}
