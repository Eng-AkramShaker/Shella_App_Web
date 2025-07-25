import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/widgets/webFooter/web_footer.dart';
import '../../../../common/widgets/appBar/web/app_bar_web.dart';
import '../../widget/web/builds/buildFilterResultWeb/build_filter_result_web.dart';
import '../../widget/web/builds/buildSearchResultWeb/build_search_result_web.dart';

class SearchFilterWeb extends StatelessWidget {
  const SearchFilterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: WebHomeApppar(
          isSearchScreen: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Custom_Text(context, text: 'الرئيسية'),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.greenColor,
                    size: 10,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Custom_Text(context, text: 'فلترة البحث'),
                ],
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [BuildSearchResultWeb(), BuildFilterResultWeb()],
              ),
              WebFooter()
            ],
          ),
        ),
      ),
    );
  }
}
