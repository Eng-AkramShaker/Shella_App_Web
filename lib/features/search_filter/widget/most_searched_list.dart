import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/common/util/app_styles.dart';

class MostSearchedList extends StatelessWidget {
  const MostSearchedList({super.key});

  @override
  Widget build(BuildContext context) {
    final searchFilterController = Provider.of<SearchFilterController>(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: searchFilterController.img.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(
                    height: 70, width: 100, child: custom_Images_asset(fit: BoxFit.fill, image: searchFilterController.img[index])),
                SizedBox(width: 10),
                Custom_Text(context, text: searchFilterController.text[index], style: font10Black400W(context, size: 10)),
              ],
            ),
          );
        });
  }
}
