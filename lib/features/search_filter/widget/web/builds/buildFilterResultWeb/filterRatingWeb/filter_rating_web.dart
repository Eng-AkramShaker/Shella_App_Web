import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/search_filter/widget/web/builds/buildFilterResultWeb/filterRatingWeb/rateBar/rate_bar.dart';
import '../../../../../../../common/util/app_styles.dart';
import '../../../../../../../common/widgets/texts/custom_text.dart';

class FilterRatingWeb extends StatelessWidget {
  const FilterRatingWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 17,
        ),
        Custom_Text(context, text: 'التقييم', style: font11Black400W(context, size: 13)),
        SizedBox(
          height: 7,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Custom_Text(context, text: 'واعلى', style: font11Black400W(context, size: 11)),
              SizedBox(
                width: 3,
              ),
              RateBar(itemCount: (5 - index)),
              Transform.scale(
                  scale: 0.7,
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {},
                    side: BorderSide(color: AppColors.gryColor_2),
                    shape: CircleBorder(),
                    visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  )),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 3,
          ),
          itemCount: 5,
        )
      ],
    );
  }
}
