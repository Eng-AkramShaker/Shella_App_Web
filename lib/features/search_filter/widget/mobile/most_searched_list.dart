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
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.45,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: searchFilterController.img.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SizedBox(height: 80, width: 110, child: custom_Images_asset(fit: BoxFit.fill, image: searchFilterController.img[index])),
                SizedBox(width: 15),
                Custom_Text(context, text: searchFilterController.text[index], style: font10Black400W(context, size: 11)),
              ],
            ),
          );
        }),
    );
  }
}