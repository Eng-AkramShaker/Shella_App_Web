import 'package:flutter/material.dart';
import '../../../../../../common/util/app_dimensions.dart';
import '../../../../../../common/util/app_styles.dart';
import '../../../../../../common/widgets/texts/custom_text.dart';
import '../../most_searched_list.dart';

class BuildMostSearched extends StatelessWidget {
  const BuildMostSearched({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Custom_Text(context, text: "الأكثر بحثآ", style: font10Grey400W(context, size: size_12(context))),
        ),
        MostSearchedList()
      ],
    );
  }
}